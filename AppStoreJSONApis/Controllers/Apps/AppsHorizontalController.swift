//
//  AppsHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/6/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

private let cellID = "cellId"

class AppsHorizontalController: HorizontalSnappingController {
    
    let topBottomPadding: CGFloat = 12
    let leftRightPadding: CGFloat = 20
    let lineSpacing: CGFloat = 10
    
    var results = [FeedResult]() {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var didSelectHandler: ((FeedResult) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.contentInset = .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppsRowCell
        if !results.isEmpty {
            cell.appIcon.sd_setImage(with: URL(string: results[indexPath.item].artworkUrl100)!, completed: nil)
            cell.appNameLabel.text = results[indexPath.item].name
            cell.companyLabel.text = results[indexPath.item].artistName
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let app = results[indexPath.item]
        didSelectHandler?(app)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.height - topBottomPadding * 2 - lineSpacing * 2) / 3
        return .init(width: view.frame.width - 48, height: (height))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
}
