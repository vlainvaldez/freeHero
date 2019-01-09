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
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        
    }
    
    // MARK: - Stored Properties
    private let navigationController: UINavigationController
    private let imageAPIService: ImageAPIService = ImageAPIService()
    
    
    // MARK: - Instance Methods
    public override func start() {
        
        self.imageAPIService.getImages()        
        
        let vc: MainVC = MainVC()
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
}
