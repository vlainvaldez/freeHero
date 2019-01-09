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
import Kingfisher

public final class MainCell: UICollectionViewCell {
    
    
    // MARK: Subviews
    public lazy var imageView: UIImageView = {
        let view: UIImageView = UIImageView()
        view.clipsToBounds = true
        view.image = UIImage(named: "Placeholder")
        return view
    }()
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.kio.subviews(forAutoLayout: [
                self.imageView
            ]
        )
        
        self.imageView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.edges.equalToSuperview()
        }
        
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
    
    public func configure(with photograph: Photograph) {
        
        let imageString: String = photograph.coverPhoto.urls.regular
        
        guard
            let thumbNailURL: URL = URL(string: imageString)
        else { return }
        
        
//        self.imageView.loadeImagefrom(url: thumbNailURL)
        
        
        self.imageView.kf.indicatorType = .activity
        self.imageView.kf.setImage(
            with: thumbNailURL,
            placeholder: UIImage(named: "Placeholder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(2)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
