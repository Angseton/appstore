//
//  SearchResultCell.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/3/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP NAME"
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.text = "9.26M"
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var screenshot1ImageView = createScreenshotImageView()
    lazy var screenshot2ImageView = createScreenshotImageView()
    lazy var screenshot3ImageView = createScreenshotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchResultCell {
    
    func setUpView() {
        let labelsStackView = ASStackView(arrangedSubviews: [self.nameLabel, self.categoryLabel, self.ratingLabel],
                                          axis: .vertical)
        
        let infoTopStackView = ASStackView(arrangedSubviews: [self.appIconImageView, labelsStackView, self.getButton],
                                           spacing: 12)
        infoTopStackView.alignment = .center
        
        let screenshotStackView = ASStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView],
                                              spacing: 12)
        screenshotStackView.distribution = .fillEqually
        
        let overallStackView = ASStackView(arrangedSubviews: [infoTopStackView, screenshotStackView],
                                               spacing: 16,
                                               axis: .vertical)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func createScreenshotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 10
        return imageView
    }
}
