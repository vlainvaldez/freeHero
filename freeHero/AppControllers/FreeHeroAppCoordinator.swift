//
//  FreeHeroAppCoordinator.swift
//  freeHero
//
//  Created by alvin joseph valdez on 08/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation
import Kio

public final class FreeHeroAppCoordinator: AppCoordinator<UINavigationController> {
    
    // MARK: Initializer
    public override init(window: UIWindow, rootViewController: UINavigationController) {
        super.init(window: window, rootViewController: rootViewController)
        
        self.window.backgroundColor = UIColor.white
        self.window.rootViewController = self.rootViewController
        self.window.makeKeyAndVisible()
        
    }
    
    // MARK: Stored Properties
    
    // MARK: Instance Methods
    
    public override func start() {
        let coordinator: MainCoordinator = MainCoordinator(
            navigationController: self.rootViewController
        )
        
        coordinator.start()
        self.add(childCoordinator: coordinator)
    }
}


