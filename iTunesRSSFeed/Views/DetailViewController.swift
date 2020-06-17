//
//  DetailViewController.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController {
    var viewModel: AlbumViewModel?

    convenience init(_ viewModel: AlbumViewModel) {
        self.init()
        self.viewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        populateUI()
    }

    private func populateUI() {
        albumDetailsLabel.text = viewModel?.albumDetails()
    }

    lazy var albumDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center

        return label
    }()

    lazy var artworkImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.sd_setImage(with: viewModel?.artwork)

        image.widthAnchor.constraint(equalToConstant: 200).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor, multiplier: 1.0).isActive = true
        return image
    }()

    lazy var iTunesStoreButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .label
        button.setTitle("iTunes Store", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(viewAlbumInAppStore), for: .touchUpInside)
        return button
    }()

    @objc private func viewAlbumInAppStore() {
        if let url = viewModel?.url, UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: {(success: Bool) in
                if success {
                    print("Launching \(url) was successful")
                }})
        }
    }

    private func configureViews() {
        view.backgroundColor = .systemBackground

        view.addSubview(artworkImage)
        artworkImage.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1.25).isActive = true
        artworkImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(albumDetailsLabel)
        albumDetailsLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        albumDetailsLabel.topAnchor.constraint(equalTo: artworkImage.bottomAnchor, constant: 20).isActive = true
        albumDetailsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        view.addSubview(iTunesStoreButton)
        iTunesStoreButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        iTunesStoreButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        iTunesStoreButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        iTunesStoreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        iTunesStoreButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
