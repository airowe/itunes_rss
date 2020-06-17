//
//  Feed.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation

struct Feed: Codable {
    let albums: [Album]

    enum CodingKeys: String, CodingKey {
        case albums = "results"
    }
}
