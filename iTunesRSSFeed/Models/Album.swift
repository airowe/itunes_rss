//
//  Album.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation

struct Album: Codable {
    let name: String
    let artistName: String
    let artwork: String

    enum CodingKeys: String, CodingKey {
        case name
        case artistName
        case artwork = "artworkUrl100"
    }
}
