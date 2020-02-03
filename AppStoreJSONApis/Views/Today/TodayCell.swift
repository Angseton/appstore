//
//  File.swift
//  AppStoreJSONApis
//
//  Created by Gastón Máspero on 01/02/2020.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    var todayItem: TodayItem! {
        didSet {
            categoryLabel.text = todayItem.category
            titleLabel.text = todayItem.title
            descriptionLabel.text = todayItem.description
            imageView.image = todayItem.image
            backgroundColor = todayItem.backgroundColor
        }
    }
    
    var topConstraint: NSLayoutConstraint!
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "garden"))
    let categoryLabel = UILabel(text: "LIFE HACK", font: .boldSystemFont(ofSize: 20))
    let titleLabel = UILabel(text: "Utilizing your time", font: .boldSystemFont(ofSize: 26))
    let descriptionLabel = UILabel(text: "All the tools and apps you need to intelligently organize your life the right way", font: .systemFont(ofSize: 16), numberOfLines: 3)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        layer.cornerRadius = 16
        backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 240, height: 240))
        
        let stackView = ASStackView(arrangedSubviews: [
            categoryLabel, titleLabel, imageContainerView, descriptionLabel],
                                             spacing: 8,
                                                axis: .vertical)
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 20, bottom: 20, right: 20))
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        self.topConstraint.isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
