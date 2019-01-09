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
    public init(collectionView: UICollectionView, photographs: [Photograph]) {
        self.collectionView = collectionView
        self.photographs = photographs
        super.init()
        
        self.collectionView.register(
            MainCell.self,
            forCellWithReuseIdentifier: MainCell.identifier
        )
        
        self.collectionView.dataSource = self
    }
    
    // MARK: - Stored Properties
    private unowned let collectionView: UICollectionView
    private var photographs: [Photograph]
    
}

extension MainDataSource: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photographs.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MainCell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCell.identifier, for: indexPath) as! MainCell
        
//        cell.configure(with: self.photographs[indexPath.row])
        
        return cell
    }
    
}


