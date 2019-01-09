//
//  DetailCoordinator.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio

public final class DetailCoordinator: AbstractCoordinator {
    
    // MARK: - Initializer
    public init(navigationController: UINavigationController, photograph: Photograph) {
        self.navigationController = navigationController
        self.photograph = photograph
        super.init()
        
    }
    
    // MARK: - Stored Properties
    private unowned let navigationController: UINavigationController
    private unowned let photograph: Photograph
    
    
    // MARK: - Instance Methods
    public override func start() {
        super.start()
        let vc: DetailVC = DetailVC(photograph: self.photograph)
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
