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

    @discardableResult
    static func downloadImage(_ imageUrl: String?,
                 then responseHandler: @escaping (QueryResult) -> Void) -> URLSessionDataTask? {
        guard let imageOrigin = imageUrl, let url = URL(string: imageOrigin) else {
            responseHandler(.failure(NetworkingError.invalidURL))
            return nil
        }

        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in

            let result = data.map(QueryResult.success) ??
                .failure(NetworkingError.network(error))

            responseHandler(result)
        }

        task.resume()

        return task
    }
}
