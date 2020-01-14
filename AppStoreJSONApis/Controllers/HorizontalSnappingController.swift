//
//  HorizontalSnappingController.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/14/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
