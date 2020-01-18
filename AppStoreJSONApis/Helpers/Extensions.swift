//
//  Extensions.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/6/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, font: UIFont, numberOfLines: Int = 1) {
        self.init(frame: .zero)
        self.text = text
        self.font = font
        self.numberOfLines = numberOfLines
    }
}

extension UIImageView {
    convenience init(cornerRadius: CGFloat) {
        self.init(frame: .zero)
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}

extension UIButton {
    convenience init(title: String) {
        self.init(type: .system)
        self.setTitle(title, for: .normal)
    }
}

extension UIScrollView {
    enum Position {
        case top
        case center
        case bottom
    }
    /// Scrolls scroll view to y position passed, animated
    func scroll(to position: Position, animated: Bool = true) {
        switch position {
        case .top:
            self.setContentOffset(CGPoint(x: 0, y: -140), animated: animated)
        case .center:
            self.setContentOffset(CGPoint(x: 0, y: contentSize.height/2-self.frame.height/2), animated: animated)
        case .bottom:
            self.setContentOffset(CGPoint(x: 0, y: contentSize.height-self.frame.height), animated: animated)
        }
    }
    /// Scrolls scroll view to y value passed, animated
    func scroll(to position: CGFloat, animated: Bool = true) {
        self.setContentOffset(CGPoint(x: 0, y: position), animated: animated)
    }
    
    /// Scrolls scroll view by y value passed, animated
    func scroll(by position: CGFloat, animated: Bool = true) {
        self.setContentOffset(CGPoint(x: 0, y: self.contentOffset.y + position), animated: animated)
    }
    
    func scroll(to view: UIView, animated: Bool = true) {
        self.setContentOffset(CGPoint(x: 0, y: view.frame.maxY), animated: animated)
    }
}

extension UIActivityIndicatorView {
    static func getStandardIndicator() -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView()
        indicator.color = .darkGray
        indicator.hidesWhenStopped = true
        indicator.startAnimating()
        return indicator
    }
}
