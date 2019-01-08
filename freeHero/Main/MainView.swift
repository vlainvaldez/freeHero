//
//  MainView.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio
import SnapKit

public final class MainView: KioView {
    
    // MARK: Subviews
    public let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 10.0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let view: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.backgroundColor = UIColor.green
        return view
    }()
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)        
        
        self.backgroundColor = UIColor.blue
        
        self.kio.subviews(forAutoLayout: [
                self.collectionView
            ]
        )
        
        self.collectionView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
