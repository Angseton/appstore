//
//  AppsRowCell.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/6/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class AppsRowCell: UICollectionViewCell {
    
    let appIcon: UIImageView = {
        let appIcon = UIImageView(cornerRadius: 12)
        appIcon.constrainWidth(constant: 64)
        appIcon.constrainHeight(constant: 64)
        return appIcon
    }()
    
    let appNameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 16))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))

    let getButton: UIButton = {
        let button = UIButton(title: "GET")
        button.setTitleColor(UIColor(red: 26/255, green: 133/255, blue: 235/255, alpha: 1), for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.constrainWidth(constant: 80)
        button.constrainHeight(constant: 32)
        button.layer.cornerRadius = 16
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let labelStackView = ASStackView(arrangedSubviews: [
            appNameLabel,
            companyLabel
            ],
                                                  spacing: 4,
                                                     axis: .vertical)
        
        let mainStackView = ASStackView(arrangedSubviews: [
                appIcon, labelStackView, getButton
            ],
                                        spacing: 10)
        
        addSubview(mainStackView)
        mainStackView.fillSuperview()
        mainStackView.distribution = .fill
        mainStackView.alignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
