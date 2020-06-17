//
//  Album.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation

struct Album: Codable {
    let artistName: String
    let artwork: String
    let copyright: String
    let genres: [Genre]
    let name: String
    let releaseDate: String

    enum CodingKeys: String, CodingKey {
        case artistName
        case artwork = "artworkUrl100"
        case copyright
        case genres
        case name
        case releaseDate
    }
}
