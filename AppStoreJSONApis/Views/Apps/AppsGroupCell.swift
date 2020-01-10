//
//  AppsGroupCell.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/6/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let horizontalController: UIViewController = {
        let controller = AppsHorizontalController()
        return controller
    }()
    
    let sectionLabel = UILabel(text: "App Section",
                               font: .boldSystemFont(ofSize: 28))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(sectionLabel)
        sectionLabel.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: trailingAnchor,
                            padding: .init(top: 0,
                                           left: 20,
                                           bottom: 0,
                                           right: 0))
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
