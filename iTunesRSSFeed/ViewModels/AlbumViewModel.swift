//
//  AlbumViewModel.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/17/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation

struct AlbumViewModel {
    private var album: Album

    init(_ album: Album) {
        self.album = album
    }
}

extension AlbumViewModel {
    var albumName: String {
        return album.name
    }

    var artist: String {
        return album.artistName
    }

    var artwork: URL? {
        return URL(string: album.artwork)
    }

    var copyright: String {
        return album.copyright
    }

    var releaseDate: String {
        return album.releaseDate
    }

    var genres: [String] {
        return album.genres.map{ $0.name }
    }
}
