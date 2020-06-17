//
//  FeedViewModel.swift
//  iTunesRSSFeed
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import Foundation
import Combine

class FeedViewModel: ObservableObject {

    @Published private(set) var albums: [Album] = []
    var cancellationToken: AnyCancellable?

    init() {
        getAlbums()
    }
}

extension FeedViewModel {
    func getAlbums() {
        cancellationToken = ItunesRSSAPI.request(.top100Albums)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                receiveValue: {
                    self.albums = $0.feed.albums
            })
    }
}
