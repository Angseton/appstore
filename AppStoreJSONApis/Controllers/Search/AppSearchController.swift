//
//  AppSearchController.swift
//  AppStoreJSONApis
//
//  Created by Gaston Maspero on 1/3/20.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit
import SDWebImage

private let reuseIdentifier = "Cell"

class AppSearchController: BaseListController {

    private var appResults = [Result]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter search term above..."
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .darkGray
        return label
    }()
    
    var timer: Timer?
    
    deinit {
        timer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        setUpSearchBar()
        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview(padding: .init(top: 280, left: 70, bottom: 0, right: 50))
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SearchResultCell
        cell.appResult = appResults[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 350)
    }
}

private extension AppSearchController {
    func fetchITunesApps(searchTerm: String) {
        Service.shared.fetchApps(searchTerm: searchTerm) { [unowned self] results, error in
            if let error = error {
                print("Failed to fetch apps:", error)
            }
            self.appResults = results
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    func setUpSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

extension AppSearchController: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false) { [weak self] _ in
            guard let this = self else { return }

            this.fetchITunesApps(searchTerm: searchText)
        }
    }
}
