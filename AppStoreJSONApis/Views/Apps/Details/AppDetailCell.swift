//
//  AppDetailCell.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/18/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    var app: Result! {
        didSet {
            appIconImageView.sd_setImage(with: URL(string: app.artworkUrl100))
            nameLabel.text = app.trackName
            releaseNotesLabel.text = app.releaseNotes
            versionLabel.text = app.version
            priceButton.setTitle(app.formattedPrice, for: .normal)
        }
    }
    
    let appIconImageView: UIImageView = {
        let image = UIImageView(cornerRadius: 16)
        image.constrainWidth(constant: 130)
        image.constrainHeight(constant: 130)
        return image
    }()
    
    let nameLabel = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    
    let versionLabel: UILabel = {
        let label = UILabel(text: "1.5.2", font: .systemFont(ofSize: 16), numberOfLines: 1)
        label.textColor = .gray
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton(title: "$4.99")
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2127602696, green: 0.4656686187, blue: 0.9615111947, alpha: 1)
        button.clipsToBounds = true
        button.layer.cornerRadius = 16
        button.constrainWidth(constant: 80)
        button.constrainHeight(constant: 32)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return button
    }()
    
    let whatsNewLabel = UILabel(text: "What´s new", font: .boldSystemFont(ofSize: 20))
    
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        let stackView = ASStackView(arrangedSubviews: [
                ASStackView(arrangedSubviews: [
                    appIconImageView,
                    ASStackView(arrangedSubviews: [
                        nameLabel,
                        priceButton,
                        UIView()
                        ],
                                spacing: 16,
                                axis: .vertical,
                                alignment: .leading
                    )
                    ],
                            spacing: 16),
                whatsNewLabel,
                versionLabel,
                releaseNotesLabel
            ],
                                    spacing: 16,
                                    axis: .vertical)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
