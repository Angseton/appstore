//
//  AppFullScreenController.swift
//  AppStoreJSONApis
//
//  Created by Gastón Máspero on 01/02/2020.
//  Copyright © 2020 Gaston Maspero. All rights reserved.
//

import UIKit

class AppFullScreenController: UITableViewController {
    
    var dismissHandler: (() -> ())?
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        tableView.contentInsetAdjustmentBehavior = .never

    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(view.layer.cornerRadius, tableView.layer.cornerRadius)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let headerCell = AppFullScreenHeaderCell()
            headerCell.closeButton.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
            headerCell.todayCell.todayItem = todayItem
            headerCell.backgroundColor  = todayItem?.backgroundColor
            return headerCell
        }
        let cell = AppFullscreenDescriptionCell()
        return cell
    }
    
    @objc func handleDismiss(button: UIButton) {
        dismissHandler?()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 450 }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}
