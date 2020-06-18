//
//  NetworkingError.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/18/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

enum NetworkingError: Error {
    case statusCode
    case invalidImage
    case invalidURL
    case network(Error?)
    case other(Error)

    static func map(_ error: Error) -> NetworkingError {
        return (error as? NetworkingError) ?? .other(error)
    }
}
