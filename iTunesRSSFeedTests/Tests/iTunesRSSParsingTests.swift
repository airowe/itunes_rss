//
//  iTunesRSSParsingTests.swift
//  iTunesRSSFeedTests
//
//  Created by Adam Rowe on 6/16/20.
//  Copyright © 2020 Adam Rowe. All rights reserved.
//

import XCTest
@testable import iTunesRSSFeed

class iTunesRSSParsingTests: XCTestCase {
    private func parseAlbum(_ filename: String) throws -> Album? {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            XCTFail("Missing file: Album.json")
            return nil
        }

        let json = try Data(contentsOf: url)
        let movie = try? JSONDecoder().decode(Album.self, from: json)

        return movie
    }

    func testAlbumCanBeParsedFromCorrectData() throws {
        guard let album = try? parseAlbum("Album") else {
            return
        }

        XCTAssertEqual(album.artist, "Gunna")
        XCTAssertEqual(album.release, "2020-05-21")
        XCTAssertEqual(album.name, "WUNNA")
        XCTAssertEqual(album.copyright, "℗ 2020 Young Stoner Life Records / 300 Entertainment")
        XCTAssertEqual(album.artwork, "https://is3-ssl.mzstatic.com/image/thumb/Music123/v4/82/db/15/82db15f2-22b2-728a-2a44-ebd7b58b2f9e/810043680837.jpg/200x200bb.png")
        XCTAssertEqual(album.url, "https://music.apple.com/us/album/wunna/1514490028?app=music")

        let genre = Genre(name: "Hip-Hop/Rap")
        XCTAssertEqual(album.genres[0], genre)
    }

    func testMovieCantBeParsedFromIncorrectData() throws {
        let movie = try? parseAlbum("MalformattedAlbum")

        XCTAssertNil(movie, "Malformatted Movie file")
    }
}
