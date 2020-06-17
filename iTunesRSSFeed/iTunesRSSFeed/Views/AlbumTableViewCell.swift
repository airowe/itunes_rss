//
//  AlbumTableViewCell.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/17/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    private var viewModel: AlbumCellViewModel? {
        didSet {
            albumLabel.text = viewModel?.albumName
            artistLabel.text = viewModel?.artist
            //artworkImage.image = UIImage(viewModel?.artwork)
        }
    }

    lazy var albumLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)])

        return label
    }()

    lazy var artistLabel: UILabel = {
        let label = UILabel()

        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)])

        return label
    }()

    lazy var artworkImage: UIImageView = {
        let image = UIImageView()

        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)

        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor)])

        return image
    }()

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        //contentView.addProgrammaticView(stickyBottomCTAView)
//        //stickyBottomCTAView.constrain(to: contentView)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

//    func setup(with albumName: String) {
//        albumLabel.text = albumName
//    }

    func setup(with viewModel: AlbumCellViewModel) {
        self.viewModel = viewModel
    }

}

extension AlbumTableViewCell {
    static let identifierForReuse = "customizeToteCTATableCell"
}
