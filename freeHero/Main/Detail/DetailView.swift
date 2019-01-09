//
//  DetailView.swift
//  freeHero
//
//  Created by alvin joseph valdez on 09/01/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import Kio
import SnapKit

public final class DetailView: KioView {
    
    // MARK: - Subviews
    private lazy var imageBanner: UIImageView = {
        let view: UIImageView = UIImageView()
        view.image = UIImage(named: "repeatingBackground")
        view.clipsToBounds = true
        view.contentMode = UIImageView.ContentMode.scaleAspectFit
        return view
    }()
    
    private let descriptionTextView: UITextView = {
        let view: UITextView = UITextView()
        view.isEditable = false
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor.clear
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textColor = UIColor.white
        return view
    }()
    
    
    // MARK: - Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.blue
        
        self.kio.subviews(forAutoLayout: [
            self.imageBanner, self.descriptionTextView
        ])
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Instance Methods
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor.random()
        
        self.imageBanner.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo((self.frame.height / 2) - 30)
        }
        
        self.descriptionTextView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.imageBanner.snp.bottom).offset(20.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
            make.height.equalTo(200.0)
        }
    }
    
    public func configure(with photograph: Photograph) {
        let imageString: String = photograph.coverPhoto.urls.full
        
        guard
            let thumbNailURL: URL = URL(string: imageString)
            else { return }
        
        
        self.imageBanner.kf.indicatorType = .activity
        self.imageBanner.kf.setImage(
            with: thumbNailURL,
            placeholder: UIImage(named: "Placeholder"),
            options: [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
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
        
        print("DESC \(photograph.imageDescription)")
        
        self.descriptionTextView.text = photograph.imageDescription
    }
    
}
