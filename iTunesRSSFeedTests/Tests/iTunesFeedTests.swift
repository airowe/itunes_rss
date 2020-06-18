//
//  iTunesFeedTests.swift
//  iTunesRSSFeedTests
//
//  Created by Adam Rowe on 6/17/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeed

class iTunesFeedTests: XCTestCase {
    
    private var album: Album!

    override func setUp() {
        super.setUp()

        try? album = parseAlbum()
    }

    override func tearDown() {
        super.tearDown()

        album = nil
    }

    private func parseAlbum() throws -> Album? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Album", withExtension: "json") else {
            XCTFail("Missing file: Album.json")
            return nil
        }

        let json = try Data(contentsOf: url)
        let movie = try? JSONDecoder().decode(Album.self, from: json)

        return movie
    }

    func testQueryRSSFeedReturnsResults() {
        let _ = ItunesRSSAPI.request(.top10Albums)
            .mapError({ (error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    XCTAssertNotNil($0.feed)
                    XCTAssertGreaterThan($0.feed.albums.count, 0)
            })
    }

}
