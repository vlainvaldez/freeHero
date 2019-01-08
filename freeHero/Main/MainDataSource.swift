//
//  MainDataSource.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import Kio

public final class MainDataSource: KioObject {
    
    // MARK: - Initializer
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        super.init()
        
        self.collectionView.register(
            MainCell.self,
            forCellWithReuseIdentifier: MainCell.identifier
        )
        
        self.collectionView.dataSource = self
    }
    
    // MARK: - Stored Properties
    private unowned let collectionView: UICollectionView
    
}

extension MainDataSource: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as! MainCell
        
        cell.backgroundColor = UIColor.random()
        
        return cell
    }
    
}
