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
    private let bannerView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()

    private let titleLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.heavy)
        view.textColor = UIColor.white
        return view
    }()

    private let sizeLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        return view
    }()

    private let likesLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        view.text = "Likes"
        return view
    }()

    private let likesValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        view.text = "5"
        return view
    }()

    private let viewsLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        view.text = "views"
        return view
    }()

    private let viewsValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        view.text = "100"
        return view
    }()

    private let downloadsLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        view.text = "Downloads"
        return view
    }()

    private let downloadsValueLabel: UILabel = {
        let view: UILabel = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        view.textColor = UIColor.white
        view.text = "100"
        return view
    }()

    private lazy var viewsStackView: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [
                self.viewsLabel, self.viewsValueLabel
            ]
        )
        view.axis = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.fill
        view.distribution = UIStackView.Distribution.fillEqually
        view.spacing = 5.0
        return view
    }()

    private lazy var likesStackView: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [
                self.likesLabel, self.likesValueLabel
            ]
        )
        view.axis = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.fill
        view.distribution = UIStackView.Distribution.fillEqually
        view.spacing = 5.0
        return view
    }()

    private lazy var downloadsStackView: UIStackView = {
        let view: UIStackView = UIStackView(arrangedSubviews: [
                self.downloadsLabel, self.downloadsValueLabel
            ]
        )
        view.axis = NSLayoutConstraint.Axis.vertical
        view.alignment = UIStackView.Alignment.fill
        view.distribution = UIStackView.Distribution.fillEqually
        view.spacing = 5.0
        return view
    }()

    private lazy var stackHorizontalView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = NSLayoutConstraint.Axis.horizontal
        view.alignment = UIStackView.Alignment.center
        view.distribution = UIStackView.Distribution.fillEqually
        view.spacing = 5.0
        return view
    }()

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

        self.backgroundColor = AppUI.Color.dark

        self.kio.subviews(forAutoLayout: [
                self.bannerView, self.titleLabel,
                self.sizeLabel, self.stackHorizontalView,
                self.descriptionTextView
            ]
        )

        self.bannerView.kio.subviews(forAutoLayout: [self.imageBanner])

        let stackViews: [UIStackView] = [
            self.likesStackView, self.viewsStackView,
            self.downloadsStackView
        ]

        self.stackHorizontalView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.bannerView.snp.bottom).offset(50.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
        }

        stackViews.forEach { (stackView: UIStackView) -> Void in
            self.stackHorizontalView.addArrangedSubview(stackView)
        }

    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Instance Methods
    public override func layoutSubviews() {
        super.layoutSubviews()

        self.bannerView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo((self.frame.height / 2) - 30)
        }

        self.titleLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.bannerView.snp.bottom).offset(10.0)
            make.leading.equalToSuperview().offset(20.0)
        }

        self.sizeLabel.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.bannerView.snp.bottom).offset(15.0)
            make.trailing.equalToSuperview().inset(20.0)
        }

        self.imageBanner.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(10.0)
            make.leading.trailing.bottom.equalToSuperview()
        }

        self.descriptionTextView.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.stackHorizontalView.snp.bottom).offset(20.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(20.0)
            make.height.equalTo(200.0)
        }
    }

    public func configure(photograph: Photograph, detail: Detail) {
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

        self.descriptionTextView.text = photograph.imageDescription
        self.titleLabel.text = photograph.title

        self.sizeLabel.text = "\(photograph.coverPhoto.width) x \(photograph.coverPhoto.height)"

        self.viewsValueLabel.text = "\(detail.views)"
        self.downloadsValueLabel.text = "\(detail.downloads)"
        self.likesValueLabel.text = "\(photograph.coverPhoto.likes)"
    }
}
