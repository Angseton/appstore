//
//  AppsHeaderCell.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/10/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    let companyLabel: UILabel = {
        let label = UILabel(text: "Facebook", font: .boldSystemFont(ofSize: 13))
        label.textColor = .blue
        return label
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel(text: "Keeping up with friends is faster than ever", font: .systemFont(ofSize: 22))
        label.numberOfLines = 2
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(cornerRadius: 8)
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = ASStackView(arrangedSubviews: [
            companyLabel,
            titleLabel,
            imageView
            ],
                                    spacing: 12,
                                    axis: .vertical)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 0, bottom: 16, right: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
