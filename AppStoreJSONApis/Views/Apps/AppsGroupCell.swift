//
//  AppsGroupCell.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/6/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
    }
}

class AppsGroupCell: UICollectionViewCell {
    
    let horizontalController: UIViewController = {
        let controller = AppsHorizontalController()
        controller.view.backgroundColor = .blue
        return controller
    }()
    
    let sectionLabel = UILabel(text: "App Section",
                               font: .boldSystemFont(ofSize: 30))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        
        addSubview(sectionLabel)
        sectionLabel.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: trailingAnchor)
        addSubview(horizontalController.view)
        horizontalController.view.anchor(top: sectionLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
