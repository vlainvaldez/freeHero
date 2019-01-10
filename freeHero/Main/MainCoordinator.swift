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
        
        self.navigationController.delegate = self
    }
    
    // MARK: - Stored Properties
    private let navigationController: UINavigationController
    private let photographs: [Photograph]
    private let imageAPIService: ImageAPIService = ImageAPIService()
    
    // MARK: - Instance Methods
    public override func start() {
        
        let vc: MainVC = MainVC(
            photographs: photographs,
            delegate: self
        )
        
        self.navigationController.setViewControllers([vc], animated: true)
    }
    
}

extension MainCoordinator: MainVCDelegate {
    
    public func imageTapped(with photograph: Photograph) {

        self.imageAPIService.getPhotoDetail(id: photograph.coverPhoto.id) { (detail: Detail) -> Void in

            let coordinator: DetailCoordinator = DetailCoordinator(
                navigationController: self.navigationController,
                photograph: photograph,
                details: detail
            )

            coordinator.start()
            self.add(childCoordinator: coordinator)

        }
    }
}


extension MainCoordinator: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard
            let fromViewController = navigationController.transitionCoordinator?.viewController(
                forKey: UITransitionContextViewControllerKey.from
            ),
            !navigationController.viewControllers.contains(fromViewController),
            fromViewController is DetailVC
        else { return }
        
        guard let coordinator = self.childCoordinators.filter({ $0 is DetailCoordinator }).first
            else { return }
        
        self.remove(childCoordinator: coordinator)
    }
}
