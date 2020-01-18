//
//  PreviewScreenshotsController.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/18/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class PreviewScreenshotsController: HorizontalSnappingController {
    
    let cellId = "cellId"
    let topBottomPadding: CGFloat = 30
    let leftRightPadding: CGFloat = 20
    var screenshotUrls: [String]? {
        didSet {
            
        }
    }
    
    class ScreenshotCell: UICollectionViewCell {
        
        let imageView = UIImageView(cornerRadius: 12)
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(imageView)
            imageView.contentMode = .scaleAspectFill
            imageView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 20, right: 0))
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return screenshotUrls?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        guard let screenshots = screenshotUrls else { return cell }
        cell.imageView.sd_setImage(with: URL(string: screenshots[indexPath.item]))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height)
    }
}
