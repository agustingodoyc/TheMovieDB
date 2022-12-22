//
//  SearchViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 16/11/2022.
//

import XCTest
@testable import TheMovieDB

final class SearchViewModelTest: XCTestCase {

    var sut: SearchViewModel!
    
    class MockSearchUseCase: UseCaseProtocol {
        var delegate: TheMovieDB.UseCaseDelegate?
        
        var movies: [Movie] = [
                    Movie(moviePersisted: MoviePersisted(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Movie 1", overview: "Over View 1", popularity: 3, posterPath: "", releaseDate: "2022-10-22", title: "Movie 1", video: true, voteAverage: 3.9, voteCount: 9, movieType: "nowPlaying"))
                    ]
        func execute(completionHandler: @escaping ([TheMovieDB.Movie]) -> Void) {
            completionHandler(movies)
        }
    }
    
    class MockViewModel: SearchViewModelProtocol  {
        var filterMovie: [Movie] = [
                    Movie(moviePersisted: MoviePersisted(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Movie 1", overview: "Over View 1", popularity: 3, posterPath: "", releaseDate: "2022-10-22", title: "Filter Movie 1", video: true, voteAverage: 3.9, voteCount: 9, movieType: "nowPlaying"))
                    ]
        func getNumberOfRowOfMovies() -> Int {
            return filterMovie.count
        }
        func getMovies(indexPath: Int) -> TheMovieDB.SearchCellModel {
            return .init(filterMovie[indexPath])
        }
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = SearchViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testGetUseCaseMovies() {
        sut = SearchViewModel(searchUseCase: MockSearchUseCase())
        sut.getSearchUseCase {
            MockSearchUseCase().execute() { result in
                XCTAssertEqual(result.count, 1)
            }
        }
        sut.searchMovie(searchText: "Mov")
        XCTAssertEqual(sut.getNumberOfRowOfMovies(), 1, "Test Search movie and There is 1 matched when search Mov in the search bar")
    }
    
    func testGetNumberOfRowOfMovies() {
        XCTAssertEqual(MockViewModel().getNumberOfRowOfMovies(), 1)
    }
    
    func testGetMovies() {
        XCTAssertEqual(SearchViewModelTest.MockViewModel().getMovies(indexPath: 0).title, MockViewModel().filterMovie[0].title)
    }
}
