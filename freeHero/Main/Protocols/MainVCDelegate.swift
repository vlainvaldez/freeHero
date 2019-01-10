//
//  MainVCDelegate.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import Foundation

public protocol MainVCDelegate: class {
    
    func imageTapped(with photograph: Photograph, completion: @escaping (Detail?) -> Void)

    func goToDetail(photograph: Photograph, detail: Detail)
    
}
