//
//  AlbumTableViewCell.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/17/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import SDWebImage
import UIKit

class AlbumTableViewCell: UITableViewCell {

    var viewModel: AlbumViewModel? {
        didSet {
            albumLabel.text = viewModel?.albumName
            artistLabel.text = viewModel?.artist
            artworkImage.sd_setImage(with: viewModel?.artwork)
        }
    }

    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal

        return stackView
    }()

    lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false

        stackView.axis = .vertical
        stackView.distribution = .fillEqually

        return stackView
    }()

    lazy var albumLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        labelsStackView.addArrangedSubview(label)

        return label
    }()

    lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center

        labelsStackView.addArrangedSubview(label)

        return label
    }()

    lazy var artworkImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true

        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureViews()
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}

    private func configureViews() {
        contentView.autoresizingMask = [.flexibleHeight]
        contentView.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)])

        mainStackView.addArrangedSubview(labelsStackView)
        mainStackView.addArrangedSubview(artworkImage)

        NSLayoutConstraint.activate([
            labelsStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75),
            labelsStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)])
    }

    func setup(with viewModel: AlbumViewModel) {
        self.viewModel = viewModel
    }
}

extension AlbumTableViewCell {
    static let identifierForReuse = "albumTableCell"
}
