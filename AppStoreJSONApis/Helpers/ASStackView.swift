//
//  VerticalStackView.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/4/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class ASStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis = .horizontal, alignment: UIStackView.Alignment = .fill) {
        super.init(frame: .zero)
        arrangedSubviews.forEach { addArrangedSubview($0) }
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
