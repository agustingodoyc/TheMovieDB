//
//  DataBaseTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 31/10/2022.
//

import XCTest
@testable import TheMovieDB

final class DataBaseTest: XCTestCase {
    
    var sut: RealmDB!
    let movies: [MoviePersisted] = [
        MoviePersisted(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Original title 1", overview: "Over View 1", popularity: 5, posterPath: "poster 1", releaseDate: "2022-05-22", title: "Title 1", video: false, voteAverage: 5.7, voteCount: 13214, movieType: "Movie type 1")
    ]
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RealmDB()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testPersistData() {
        sut.persistData(movies)
        XCTAssertFalse(sut.isEmpty)
    }
    
    func testGetRealmData() {
        XCTAssertEqual(sut.getData().count, 1)
    }
    
    func testClearData() {
        sut.clearData()
        XCTAssertTrue(sut.isEmpty)
    }
}
