//
//  MainViewController.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Combine
import UIKit

class MainViewController: UITableViewController {

    var albums = [Album]()
    let viewModel = FeedViewModel()
    private var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 125
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(AlbumTableViewCell.self,
                           forCellReuseIdentifier: AlbumTableViewCell.identifierForReuse)

        bindViewModel()
    }

    private func bindViewModel() {
        viewModel.$albums.sink { [weak self] albums in
            self?.albums = albums
            self?.tableView.reloadData()
        }.store(in: &cancellables)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifierForReuse, for: indexPath) as? AlbumTableViewCell else {
            return UITableViewCell()
        }

        let album = albums[indexPath.row]
        cell.setup(with: AlbumCellViewModel(album))

        cell.layoutIfNeeded()
        
        return cell
    }
}
