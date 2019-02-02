//
//  DetailVC.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio

public final class DetailVC: KioViewController {
    
    // MARK: - Initializer
    public init(photograph: Photograph, details: Detail) {
        self.photograph = photograph
        self.details = details
        super.init(nibName: nil, bundle: nil)
    }
    
    public required  init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController Lifecycle Methods
    
    public override func loadView() {
        self.view = DetailView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView.configure(photograph: self.photograph, detail: self.details)

    }


    
    // MARK: - Stored Properties
    private let photograph: Photograph
    private let details: Detail
    
    
}

// MARK: - Views
extension DetailVC {
    unowned var rootView: DetailView { return self.view as! DetailView }
}
