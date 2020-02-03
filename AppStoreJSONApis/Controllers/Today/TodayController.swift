//
//  TodayController.swift
//  AppStoreJSONApis
//
//  Created by Gastón Máspero on 01/02/2020.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class TodayController: BaseListController {
    
    let cellId = "cellId"
    
    let items = [TodayItem(category: "LIFE HACK", title: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize your life the right way", backgroundColor: .white),
                 TodayItem(category: "Holidays", title: "Travel on a budget", image: #imageLiteral(resourceName: "holiday"), description: "Find out all you need to know on how to travel without packing eberything!", backgroundColor: #colorLiteral(red: 0.9774419665, green: 0.9603155255, blue: 0.7258630395, alpha: 1))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = #colorLiteral(red: 0.9306824287, green: 0.9306824287, blue: 0.9306824287, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TodayCell
        cell.todayItem = items[indexPath.row]
        return cell
    }
    
    var appFullScreenController: AppFullScreenController!
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let appFullScreenController = AppFullScreenController()
        appFullScreenController.todayItem = items[indexPath.row]
        appFullScreenController.dismissHandler = {
            self.handleRemoveRedView()
        }
        let yellowView = appFullScreenController.view!
        view.addSubview(yellowView)
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        self.startingFrame = startingFrame
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        self.topConstraint = yellowView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        self.leadingConstraint = yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        self.widthConstraint = yellowView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        self.heightConstraint = yellowView.heightAnchor.constraint(equalToConstant: startingFrame.height)
        [self.topConstraint, self.leadingConstraint, self.widthConstraint, self.heightConstraint].forEach { (constraint) in
            constraint?.isActive = true
        }
        self.view.layoutIfNeeded()

        addChild(appFullScreenController)
        self.collectionView.isUserInteractionEnabled = false
        self.appFullScreenController = appFullScreenController
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            self.view.layoutIfNeeded()
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height
            
            guard let cell = self.appFullScreenController.tableView.cellForRow(at: [0, 0]) as? AppFullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 48
            cell.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    var startingFrame: CGRect?
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    func handleRemoveRedView() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.appFullScreenController.tableView.contentOffset = .zero
            self.appFullScreenController.view.layer.cornerRadius = 16
            guard let startingFrame = self.startingFrame else { return }
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            let cellHeader = self.appFullScreenController.tableView.cellForRow(at: .init(row: 0, section: 0)) as! AppFullScreenHeaderCell
            cellHeader.closeButton.alpha = 0
            if let tabBarFrame = self.tabBarController?.tabBar.frame {
                self.tabBarController?.tabBar.frame.origin.y = self.view.frame.size.height - tabBarFrame.height
            }
            guard let cell = self.appFullScreenController.tableView.cellForRow(at: [0, 0]) as? AppFullScreenHeaderCell else { return }
            cell.todayCell.topConstraint.constant = 24
            self.view.layoutIfNeeded()
        }, completion: { _ in
            self.appFullScreenController.view.removeFromSuperview()
            self.appFullScreenController.removeFromParent()
            self.collectionView.isUserInteractionEnabled = true
            print("completion")
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    
}
