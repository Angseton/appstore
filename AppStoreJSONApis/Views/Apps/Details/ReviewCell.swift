//
//  ReviewCell.swift
//  AppStoreJSONApis
//
//  Created by Gastón Máspero on 25/01/2020.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class ReviewCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "review title", font: .boldSystemFont(ofSize: 18))
    
    let authorLabel = UILabel(text: "Author", font: .systemFont(ofSize: 16))
    
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    
    let starsStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach { _ in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubviews.append(imageView)
        }
        arrangedSubviews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
    
    let bodyLabel = UILabel(text: "Review body\nReview body\nReview body", font: .systemFont(ofSize: 18), numberOfLines: 4)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = #colorLiteral(red: 0.9450011849, green: 0.9406232238, blue: 0.9736520648, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let stackView = ASStackView(arrangedSubviews: [
                ASStackView(arrangedSubviews: [
                    titleLabel, authorLabel
                ], spacing: 8, axis: .horizontal),
                starsStackView,
                bodyLabel
            ],
                                    spacing: 12,
                                    axis: .vertical,
                                    alignment: .fill)
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12))
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        authorLabel.textAlignment = .right
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
