//
//  VerticalStackView.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/4/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class CustomStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis = .horizontal) {
        super.init(frame: .zero)
        self.axis = axis
        self.spacing = spacing
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
