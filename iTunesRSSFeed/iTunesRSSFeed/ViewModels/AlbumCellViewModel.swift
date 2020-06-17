//
//  AlbumCellViewModel.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/17/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation

struct AlbumCellViewModel {
    private var album: Album

    init(_ album: Album) {
        self.album = album
    }
}

extension AlbumCellViewModel {
    var albumName: String {
        return album.name
    }

    var artist: String {
        return album.artistName
    }

    var artwork: URL? {
        return URL(string: album.artwork)
    }
}
