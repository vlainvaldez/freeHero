//
//  CustomLayout.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

protocol CustomCollectionViewLayoutDelegate: class {
    
    func collectionView(
        collectionView: UICollectionView,
        heightForItemAtIndexPath indexPath: IndexPath
    ) -> CGFloat
    
}

public class CustomCollectionViewLayout: UICollectionViewLayout {
    
    weak var delegate: CustomCollectionViewLayoutDelegate!
    public var numberOfColumns: Int = 1
    
    private var cache:  [UICollectionViewLayoutAttributes] = [UICollectionViewLayoutAttributes]()
    private var contentHeight: CGFloat = 0
    private var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    
    public override var collectionViewContentSize: CGSize {
        return CGSize(
            width: self.contentWidth,
            height: self.contentHeight
        )
    }
    
    public override func prepare() {
        if cache.isEmpty {
            let columnWidth: CGFloat = self.contentWidth / CGFloat(self.numberOfColumns)
            var xOffset: [CGFloat] = [CGFloat]()
            
            for column in 0...numberOfColumns{
                xOffset.append(CGFloat(column) * columnWidth)
                
            }
            
            var yOffset: [CGFloat] = [CGFloat](repeating: 0, count: self.numberOfColumns)
            
            var column: Int = 0
            
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                let indexPath: IndexPath = IndexPath(item: item, section: 0)
                let height = delegate.collectionView(
                    collectionView: collectionView!,
                    heightForItemAtIndexPath: indexPath
                )
                
                let frame: CGRect = CGRect(
                    x: xOffset[column],
                    y: yOffset[column],
                    width: columnWidth,
                    height: height
                )
                
                let attributes: UICollectionViewLayoutAttributes = UICollectionViewLayoutAttributes(
                    forCellWith: indexPath
                )
                
                attributes.frame = frame
                self.cache.append(attributes)
                self.contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column < (self.numberOfColumns - 1) ? (column + 1) : 0
                
            }
        }
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        
        return visibleLayoutAttributes
    }
    
    public override  func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }

}
