//
//  DataManagerTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 31/10/2022.
//

import XCTest
@testable import TheMovieDB

final class DataManagerTest: XCTestCase {
    
    var sut: DataManager!
    
    struct MockProvider: ServiceProtocol {
    
        var movieData: [MovieData] = [
            MovieData(adult: true, backdropPath: "backdropPath", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Movie 1", overview: "Over View 1", popularity: 3, posterPath: "", releaseDate: "2022-10-22", title: "Movie 1", video: true, voteAverage: 3.9, voteCount: 9)
        ]
        
        var movieDetailData: MovieDetailData =
        MovieDetailData(adult: true,
                        backdropPath: "",
                        belongsToCollection: BelongsToCollection(id: 1, name: "Colletion1", posterPath: "", backdropPath: ""),
                        budget: 1,
                        genres: [Genres(id: 1, name: "Horror")],
                        homepage: "",
                        id: 3,
                        imbdId: "",
                        originalLanguage: "Spanish",
                        originalTitle: "MovieDetail1",
                        overview: "",
                        popularity: 3.2,
                        posterPath: "",
                        productionCompanies: [ProductionCompanies(name: "Company 1", id: 1, logoPath: "", originCountry: "Argentina")],
                        productionCountries: [ProductionCountries(iso_3166_1: "1", name: "Argentina")],
                        releaseDate: "2022-02-22",
                        revenue: 1,
                        runtime: 1,
                        spokenLanguages: [SpokenLanguages(iso_639_1: "2", name: "English")],
                        status: "status 1",
                        tagline: "tagline 1",
                        title: "title 1",
                        video: false,
                        voteAverage: 4,
                        voteCount: 4)
        
        func getEndPointMovie(_ endpoint: TheMovieDB.Endpoints, completion: @escaping (Result<[TheMovieDB.MovieData], TheMovieDB.ServiceError>) -> Void) {
            completion(.success(movieData))
        }
        
        func getMovieDetail(_ id: String, completion: @escaping (Result<TheMovieDB.MovieDetailData, TheMovieDB.ServiceError>) -> Void) {
            completion(.success(movieDetailData))
        }
    }
    
    class MockDataBase: DataBase {
        var moviePersisted: [MoviePersisted] = []
        var isEmpty: Bool { return moviePersisted.isEmpty }
        
        func persistData(_ movies: [MoviePersisted]) {
            moviePersisted = movies
        }
        
        func getData() -> [MoviePersisted] {
            return moviePersisted
        }
        
        func clearData() {
            moviePersisted.removeAll()
        }
    }
    
    class MockDataManagerDelegate: DataManagerDelegate {
        var callBack: ( ([MoviePersisted]) -> Void )?
        func updateData(_ data: [TheMovieDB.MoviePersisted]) {
            callBack?(data)
        }
    }
    
    class MockServiceFailure: ServiceProtocol {
        func getEndPointMovie(_ endpoint: TheMovieDB.Endpoints, completion: @escaping (Result<[TheMovieDB.MovieData], TheMovieDB.ServiceError>) -> Void) {
            completion(.failure(.emptyData))
        }
        
        func getMovieDetail(_ id: String, completion: @escaping (Result<TheMovieDB.MovieDetailData, TheMovieDB.ServiceError>) -> Void) {
            completion(.failure(.parseError))
        }
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DataManager(service: MockProvider(), dataBase: MockDataBase())
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testDataMoviesWithEmptyDatabaseAndServiceFailure() {
        sut = DataManager(service: MockServiceFailure(), dataBase: MockDataBase())
        let promise = self.expectation(description: "Scaling")

        sut.getMovie(Endpoints.nowPlaying) { result in
            XCTAssertEqual(result.isEmpty, true)
                promise.fulfill()
        }

        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetDataMoviesEmptyDataBase() {
        
        let promise = self.expectation(description: "Geting Data")
        
        sut.getMovie(Endpoints.nowPlaying) { result in
            XCTAssertEqual(result.count, 1)
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetDataMoviesInTheDataBase() {
        
        let promise = self.expectation(description: "Geting Data")
        
        sut.getMovie(Endpoints.nowPlaying) { result in
            XCTAssertEqual(result[0].title, "Movie 1")
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testDelegate() {
        let dataBase = MockDataBase()
        dataBase.moviePersisted = [
            MoviePersisted(adult: true, backdropPath: "backdropPath 1", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Original title 1", overview: "Overview 1", popularity: 3.4, posterPath: "posterPath 1", releaseDate: "2022-03-13", title: "Title 1", video: false, voteAverage: 5.8, voteCount: 10, movieType: "movieType 1"),
            MoviePersisted(adult: true, backdropPath: "backdropPath 2", genreIDS: [1,2,3,4], id: 2, originalLanguage: "English", originalTitle: "Original title 2", overview: "Overview 2", popularity: 3.4, posterPath: "posterPath 2", releaseDate: "2022-01-18", title: "Title 2", video: false, voteAverage: 7.9, voteCount: 100, movieType: "movieType 2")
        ]
        let sut: DataManager = DataManager(service: MockProvider(), dataBase: dataBase)
        let delegate = MockDataManagerDelegate()
        sut.delegate = delegate
        
        let promise = self.expectation(description: "Geting data")
        let servicePromise = self.expectation(description: "Calling delegate")
        
        sut.getMovie(Endpoints.nowPlaying) { data in
            XCTAssertEqual(data.count, 2)
            promise.fulfill()
        }
        
        delegate.callBack = { data in
            XCTAssertEqual(data.count, 1)
            servicePromise.fulfill()
        }
        
        wait(for: [promise,servicePromise], timeout: 5)
    }
    
    func testGetMovieDetails() {
        let promise = self.expectation(description: "Geting Data")
        
        sut.getDetail("1") { result in
            XCTAssertEqual(result.title, "title 1")
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetAllMovie() {
        let dataBase = MockDataBase()
        dataBase.moviePersisted = [
            MoviePersisted(adult: true, backdropPath: "backdropPath 1", genreIDS: [1,2,3], id: 1, originalLanguage: "Spanish", originalTitle: "Original title 1", overview: "Overview 1", popularity: 3.4, posterPath: "posterPath 1", releaseDate: "2022-03-13", title: "Title 1", video: false, voteAverage: 5.8, voteCount: 10, movieType: "movieType 1"),
            MoviePersisted(adult: true, backdropPath: "backdropPath 2", genreIDS: [1,2,3,4], id: 2, originalLanguage: "English", originalTitle: "Original title 2", overview: "Overview 2", popularity: 3.4, posterPath: "posterPath 2", releaseDate: "2022-01-18", title: "Title 2", video: false, voteAverage: 7.9, voteCount: 100, movieType: "movieType 2")
        ]
        let sut: DataManager = DataManager(service: MockProvider(), dataBase: dataBase)
        
        let promise = self.expectation(description: "Getting Movies")
        
        sut.getAllMovies() { result in
            XCTAssertEqual(result.count, 2)
            promise.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
