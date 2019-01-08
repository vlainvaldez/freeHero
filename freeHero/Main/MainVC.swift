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
        
    // MARK: - Initializer
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        
        self.dataSource = MainDataSource(collectionView: self.rootView.collectionView)
        
        if let layout = self.rootView.collectionView.collectionViewLayout as? CustomCollectionViewLayout {
            layout.delegate = self
        }

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
}

// MARK: - Views
extension MainVC {
    
    unowned var rootView: MainView { return self.view as! MainView }

}

// MARK: - UICollectionViewDelegateFlowLayout Functions
//extension MainVC: UICollectionViewDelegateFlowLayout {
//
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(
//            width: (self.rootView.collectionView.frame.width - 30.0) / 2.0,
//            height: (self.rootView.collectionView.frame.height - 30.0) / 4.0
//        )
//
//    }
//}

extension MainVC: CustomCollectionViewLayoutDelegate {
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: IndexPath) -> CGFloat {
        
        let number = Int.random(in: 200 ... 500)
        
        return CGFloat(number)
        
    }
    
    
}


