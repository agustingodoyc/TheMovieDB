//
//  TopRatedUseCaseTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 01/11/2022.
//

import Foundation
import XCTest
@testable import TheMovieDB

final class TopRatedUseCaseTest: XCTestCase {
    
    var sut: TopRatedUseCase!
    
    class MockDataManager: DataManagerProtocol {
        var moviePersisted: [MoviePersisted] =
        [
            MoviePersisted(adult: true, backdropPath: "backdropPath 1", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Original title 1", overview: "Overview 1", popularity: 3.4, posterPath: "posterPath 1", releaseDate: "2022-03-13", title: "Title 1", video: false, voteAverage: 5.8, voteCount: 10, movieType: "movieType 1"),
            MoviePersisted(adult: true, backdropPath: "backdropPath 2", genreIDS: [1,2,3,4], id: 2, originalLanguage: "English", originalTitle: "Original title 2", overview: "Overview 2", popularity: 3.4, posterPath: "posterPath 2", releaseDate: "2022-01-18", title: "Title 2", video: false, voteAverage: 7.9, voteCount: 100, movieType: "movieType 2")
        ]
        
        func getMovie(_ endpoint: TheMovieDB.Endpoints, completionHandler: @escaping ([TheMovieDB.MoviePersisted]) -> Void) {
            completionHandler(moviePersisted)
        }
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = TopRatedUseCase()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testUseCaseExecute() {
        sut.execute() { movie in
            XCTAssertEqual(movie[0].title, "Title 1")
            XCTAssertEqual(movie[1].title, "Title 2")
        }
    }
}
