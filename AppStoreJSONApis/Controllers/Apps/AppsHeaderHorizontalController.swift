//
//  AppsHeaderHorizontalController.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/10/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

private let headerAppCell = "headerAppCell"

class AppsHeaderHorizontalController: HorizontalSnappingController {
    
    var socials = [SocialApp]() {
        didSet {
            print("Socials: \(socials.count)")
            collectionView.reloadData()
        }
    }
    
    let topBottomPadding: CGFloat = 30
    let leftRightPadding: CGFloat = 20
    let lineSpacing: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: headerAppCell)
        collectionView.contentInset = .init(top: topBottomPadding, left: leftRightPadding, bottom: topBottomPadding, right: leftRightPadding)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 48, height: view.frame.height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerAppCell, for: indexPath) as! AppsHeaderCell
        let socialApp = socials[indexPath.item]
        cell.companyLabel.text = socialApp.name
        cell.titleLabel.text = socialApp.tagline
        cell.imageView.sd_setImage(with: URL(string: socialApp.imageUrl), completed: nil)
        return cell
    }
}
