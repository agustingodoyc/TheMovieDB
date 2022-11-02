//
//  NowPlayingViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 31/10/2022.
//

import XCTest
@testable import TheMovieDB

final class NowPlayingViewModelTest: XCTestCase {
    
    var sut: NowPlayingViewModel!
    
    class MockNowPlayingUseCase: UseCase {
        var nowPlayingMovie: [Movie] = [
                    Movie(moviePersisted: MoviePersisted(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Movie 1", overview: "Over View 1", popularity: 3, posterPath: "", releaseDate: "2022-10-22", title: "Movie 1", video: true, voteAverage: 3.9, voteCount: 9, movieType: "nowPlaying"))
                    ]
        func execute(completionHandler: @escaping ([TheMovieDB.Movie]) -> Void) {
            completionHandler(nowPlayingMovie)
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
        sut = NowPlayingViewModel(nowPlayingUseCase: MockNowPlayingUseCase())
        
        sut.getUseCaseNowPlayingMovie {
            MockNowPlayingUseCase().execute() { result in
                self.sut.movies = result
                XCTAssertEqual(self.sut.movies.count, 1)
            }
        }
        
        XCTAssertEqual(self.sut.getNumberOfRowOfNowPlayingMovie(), 1, "Test getNumberOfRowOfNowPlayingMovie() success")
        XCTAssertEqual(self.sut.getNowPlayingMovie (indexPath: 0).title, MockNowPlayingUseCase().nowPlayingMovie[0].title, "Test getNowPlayingMovie(indexPath: Int) success")
    }
}
