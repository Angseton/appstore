//
//  ReviewsController.swift
//  AppStoreJSONApis
//
//  Created by Gastón Máspero on 25/01/2020.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class ReviewsController: HorizontalSnappingController {
    let cellId = "cellId"
    var reviews: Review? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ReviewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 20, bottom: 0, right: 16)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews?.feed.entry.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ReviewCell
        let entry = reviews?.feed.entry[indexPath.item]
        cell.authorLabel.text = entry?.author.name.label
        cell.bodyLabel.text = entry?.content.label
        cell.titleLabel.text = entry? .title.label
        let ratingInt = Int(entry?.rating.label ?? "0") ?? 0
        for (index, view) in cell.starsStackView.arrangedSubviews.enumerated() {
            view.alpha = index >= ratingInt ? 0 : 1
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
