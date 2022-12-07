//
//  UpcomingViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 11/11/2022.
//

import Foundation
import XCTest
@testable import TheMovieDB

final class UpcomingViewModelTest: XCTestCase {
    
    var sut: UpcomingViewModel!
    
    class MockUpcomingUseCase: TabBarUseCase {
        
        var delegate: TheMovieDB.UseCaseDelegate?
        var upcomingMovie: [Movie] = [
                    Movie(moviePersisted: MoviePersisted(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Movie 1", overview: "Over View 1", popularity: 3, posterPath: "", releaseDate: "2022-10-22", title: "Movie 1", video: true, voteAverage: 3.9, voteCount: 9, movieType: "nowPlaying"))
                    ]
        func execute(completionHandler: @escaping ([TheMovieDB.Movie]) -> Void) {
            completionHandler(upcomingMovie)
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
        sut = UpcomingViewModel(upcomingUseCase: MockUpcomingUseCase())
        
        sut.getUseCaseUpcomingMovie {
            MockUpcomingUseCase().execute() { result in
                self.sut.movies = result
                XCTAssertEqual(self.sut.movies.count, 1)
            }
        }
        
        XCTAssertEqual(self.sut.getNumberOfRowOfUpcomingMovie(), 1, "Test getNumberOfRowOfUpcomingMovie() success")
        XCTAssertEqual(self.sut.getUpcomingMovie(indexPath: 0).title, MockUpcomingUseCase().upcomingMovie[0].title,"Test getUpcomingMovie(indexPath: Int) success")
    }
}
