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
        return album.artist
    }

    var artwork: String? {
        return album.artwork
    }

    var copyright: String {
        return album.copyright
    }

    var releaseDate: String {
        return album.release
    }

    var genres: [String] {
        return album.genres.map{ $0.name }
    }

    var url: URL? {
        return URL(string: album.url)
    }

    func albumDetails() -> String {
        var albumDetails = ""

        let detailsMirror = Mirror(reflecting: album as Any)

        detailsMirror.children.filter{
            $0.label != "artwork" && $0.label != "url"
        }.forEach{
            switch $0.value {
                case is String:
                    if let label = $0.label {
                        albumDetails.append("\(label.capitalized): \($0.value)\n")
                }
                default:
                    //Genres
                    if let label = $0.label {
                        let genreString = genres.joined(separator: ", ")
                        albumDetails.append("\(label.capitalized): \(genreString)\n")
                }
            }
        }

        return albumDetails
    }
}
