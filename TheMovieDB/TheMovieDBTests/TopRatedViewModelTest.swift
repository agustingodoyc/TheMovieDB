//
//  TopRatedViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 01/11/2022.
//

import Foundation
import XCTest
@testable import TheMovieDB

final class TopRatedViewModelTest: XCTestCase {
    
    var sut: TopRatedViewModel!
    
    class MockTopRatedUseCase: UseCase {
        var topRatedMovie: [Movie] = [
                    Movie(moviePersisted: MoviePersisted(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Movie 1", overview: "Over View 1", popularity: 3, posterPath: "", releaseDate: "2022-10-22", title: "Movie 1", video: true, voteAverage: 3.9, voteCount: 9, movieType: "nowPlaying"))
                    ]
        func execute(completionHandler: @escaping ([TheMovieDB.Movie]) -> Void) {
            completionHandler(topRatedMovie)
        }
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetUseCaseNowPlayingMovie() {
        sut = TopRatedViewModel(topRatedUseCase: MockTopRatedUseCase())
        
        sut.getTopRatedMovie {
            MockTopRatedUseCase().execute() { result in
                self.sut.movies = result
                XCTAssertEqual(self.sut.movies.count, 1)
            }
        }
        
        XCTAssertEqual(self.sut.getNumberOfRowOfTopRatedMovie(), 1, "Test getNumberOfRowOfNowPlayingMovie() success")
        XCTAssertEqual(self.sut.getMovie(0).title, MockTopRatedUseCase().topRatedMovie[0].title,"Test getMovie() success")
    }
}
