//
//  DetailViewModelTest.swift
//  TheMovieDBTests
//
//  Created by Angela Lee on 10/11/2022.
//

import XCTest
@testable import TheMovieDB

final class DetailViewModelTest: XCTestCase {
    
    var sut: DetailViewModel!
    
    class MockMovieDetailUseCase: DetailsUseCase {
        var movieDetail: MovieDetail =
        MovieDetail(movieDetailData: MovieDetailData(
                adult: true,
                backdropPath: "",
                belongsToCollection: BelongsToCollection(id: 1, name: "Colletion1", posterPath: "", backdropPath: ""),
                budget: 1,
                genres: [Genres(id: 1, name: "Horror")],
                homepage: "",
                id: 1,
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
                voteCount: 4))
        func execute(movieId: String, completionHandler: @escaping (TheMovieDB.MovieDetail) -> Void) {
            completionHandler(movieDetail)
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
        sut = DetailViewModel(detailsUseCase: MockMovieDetailUseCase(), movieID: "1")
        XCTAssertEqual(sut.movieTitle, "title 1")
    }
}
