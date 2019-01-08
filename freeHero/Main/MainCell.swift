//
//  MainCell.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio
import SnapKit

public final class MainCell: UICollectionViewCell {
    
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Configurables
extension MainCell {
    public static var identifier: String {
        return "MainCell"
    }
}
