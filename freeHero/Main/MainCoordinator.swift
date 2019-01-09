//
//  MainCoordinator.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import Kio

public final class MainCoordinator: AbstractCoordinator {
    
    
    // MARK: - Initializer
    public init(navigationController: UINavigationController, photographs: [Photograph]) {
        self.navigationController = navigationController
        self.photographs = photographs
        super.init()
        
    }
    
    // MARK: - Stored Properties
    private let navigationController: UINavigationController
    private let photographs: [Photograph]
    
    
    // MARK: - Instance Methods
    public override func start() {
        
        let vc: MainVC = MainVC(photographs: photographs)
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
}
