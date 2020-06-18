//
//  iTunesRSSAPI.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation
import Combine

enum ItunesRSSAPI {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://rss.itunes.apple.com/api/v1/us/")!
}

enum APIPath: String {
    case top10Albums = "apple-music/top-albums/all/10/explicit.json"
    case top100Albums = "apple-music/top-albums/all/100/explicit.json"
}

extension ItunesRSSAPI {

    static func request(_ path: APIPath) -> AnyPublisher<Response, Error> {
        guard let components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }

        let request = URLRequest(url: components.url!)

        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
