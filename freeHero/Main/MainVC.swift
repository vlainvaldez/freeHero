//
//  ViewController.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio

public final class MainVC: KioViewController {
    
    // MARK: - Delegate Properties
    private weak var delegate: MainVCDelegate?
    
    // MARK: - Initializer
    public init(photographs: [Photograph], delegate: MainVCDelegate) {
        self.photographs = photographs
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        
        self.dataSource = MainDataSource(
            collectionView: self.rootView.collectionView,
            photographs: photographs
        )
        
//        if let layout = self.rootView.collectionView.collectionViewLayout as? CustomCollectionViewLayout {
//            layout.delegate = self
//
//        }
        
        self.rootView.collectionView.delegate = self

    }
    
    public required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController Lifecycle Methods
    
    public override func loadView() {
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Stored Properties
    private var dataSource: MainDataSource!
    public var photographs: [Photograph]
    private let loadingQueue = OperationQueue()
    private var loadingOperations: [IndexPath: DataLoadOperation] = [:]
    private var fetchMoreIsEnabled: Bool = false
    private let imageAPIService: ImageAPIService = ImageAPIService()
    private var page: Int = 1
}

// MARK: - Views
extension MainVC {
    
    unowned var rootView: MainView { return self.view as! MainView }

}

// MARK: - UICollectionViewDelegateFlowLayout Functions
extension MainVC: UICollectionViewDelegateFlowLayout {

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(
            width: (self.rootView.collectionView.frame.width - 30.0) / 2.0,
            height: (self.rootView.collectionView.frame.height - 30.0) / 4.0
        )

    }


}

// MARK: - ScrollViewDelegate Functions
extension MainVC {
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        let contentHeight = scrollView.contentSize.height
        
        if offsetY > contentHeight - scrollView.contentSize.height {
            if !self.fetchMoreIsEnabled {
                
                self.beginbatchFetch()
            }
        }
    }
    
    public func beginbatchFetch() {
        self.fetchMoreIsEnabled = true
        
        self.page += 1
        
        self.imageAPIService.getPhotograph(page: self.page) { [weak self] (photographs: [Photograph]) -> Void in
            guard let self = self else { return }
            DispatchQueue.main.async {
                
                self.photographs.append(contentsOf: photographs)
                self.dataSource.photographs.append(contentsOf: photographs)
                
                self.dataSource.collectionView.reloadData()
                self.fetchMoreIsEnabled = false
                
            }
        }
        
    }
}

// MARK: - CustomCollectionViewLayoutDelegate Functions
//extension MainVC: CustomCollectionViewLayoutDelegate {
//    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
//
//        let photographHeight: Int = self.photographs[indexPath.row].coverPhoto.height
//
//        let calculatedHeightValue: Double = 0.07 * Double(photographHeight)
//
//        return CGFloat(calculatedHeightValue)
//    }
//}

// MARK: - UICollectionViewDelegate Functions
extension MainVC: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let delegate = self.delegate else { return }
        
        delegate.imageTapped(with: self.photographs[indexPath.row])
    }
    
    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        guard let cell = cell as? MainCell else { return }
        
        let updateCellClosure: (Photograph?) -> Void = { [weak self] photograph in
            guard let self = self else { return }
            
            cell.configure(with: photograph!)
            
            self.loadingOperations.removeValue(forKey: indexPath)
        }
        
        if let dataLoader = loadingOperations[indexPath] {
            if let photograph = dataLoader.photograph {
                cell.configure(with: photograph)
                loadingOperations.removeValue(forKey: indexPath)
            } else {
                dataLoader.loadingCompletionHandler = updateCellClosure
            }
        } else {
            if let dataLoader = self.loadPhotograph(at: indexPath.item) {
                dataLoader.loadingCompletionHandler = updateCellClosure
                
                loadingQueue.addOperation(dataLoader)
                
                loadingOperations[indexPath] = dataLoader
            }
        }
    }
    
    func loadPhotograph(at index: Int) -> DataLoadOperation? {
        if (0..<self.photographs.count).contains(index) {
            return DataLoadOperation(self.photographs[index])
        }
        return .none
    }
    
    public func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        if let dataLoader = loadingOperations[indexPath] {
            dataLoader.cancel()
            loadingOperations.removeValue(forKey: indexPath)
        }
    }
    
}

// MARK: - UICollectionViewDataSourcePrefetching Functions
extension MainVC: UICollectionViewDataSourcePrefetching {
    
    public func collectionView(_ collectionView: UICollectionView,
                               prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            
            if let _ = loadingOperations[indexPath] {
                continue
            }
            
            if let dataLoader = self.loadPhotograph(at: indexPath.item) {
                loadingQueue.addOperation(dataLoader)
                loadingOperations[indexPath] = dataLoader
            }
        }
        
    }
}
