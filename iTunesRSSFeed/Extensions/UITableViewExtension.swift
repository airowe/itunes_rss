//
//  UITableViewExtension.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/17/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import UIKit

extension UITableView {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            let activityView = UIActivityIndicatorView(style: .large)
            self.backgroundView = activityView
            activityView.startAnimating()
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.backgroundView = nil
        }
    }
}
