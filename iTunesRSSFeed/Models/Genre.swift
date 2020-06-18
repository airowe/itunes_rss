//
//  Genre.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

struct Genre: Codable {
    let name: String
}

extension Genre: Hashable {
    public static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.name == rhs.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
