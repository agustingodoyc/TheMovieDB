//
//  MovieDetails.swift
//  TheMovieDB
//
//  Created by Angela Lee on 03/11/2022.
//

import Foundation
import RealmSwift

class MovieDetailData: Object, Codable {
    @Persisted var adult: Bool?
    @Persisted var backdropPath: String?
    @Persisted var belongsToCollection: BelongsToCollection?
    @Persisted var budget: Int?
    @Persisted var genres = List<Genres> ()
    @Persisted var homepage: String?
    @Persisted var id: Int?
    @Persisted var imbdId: String?
    @Persisted var originalLanguage: String?
    @Persisted var originalTitle: String?
    @Persisted var overview: String?
    @Persisted var popularity: Double?
    @Persisted var posterPath: String?
    @Persisted var productionCompanies = List<ProductionCompanies>()
    @Persisted var productionCountries = List<ProductionCountries>()
    @Persisted var releaseDate: String?
    @Persisted var revenue: Int?
    @Persisted var runtime: Int?
    @Persisted var spokenLanguages = List<SpokenLanguages>()
    @Persisted var status: String?
    @Persisted var tagline: String?
    @Persisted var title: String?
    @Persisted var video: Bool?
    @Persisted var voteAverage: Double?
    @Persisted var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget
        case genres
        case homepage
        case id
        case imbdId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    convenience init(
        adult: Bool,
        backdropPath: String,
        belongsToCollection: BelongsToCollection,
        budget: Int,
        genres: [Genres],
        homepage: String,
        id: Int,
        imbdId: String,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        productionCompanies: [ProductionCompanies],
        productionCountries: [ProductionCountries],
        releaseDate: String,
        revenue: Int,
        runtime: Int,
        spokenLanguages: [SpokenLanguages],
        status: String,
        tagline: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int) {
            self.init()
            self.adult = adult
            self.backdropPath = backdropPath
            self.belongsToCollection = belongsToCollection
            self.budget = budget
            self.genres.append(objectsIn: genres)
            self.homepage = homepage
            self.id = id
            self.imbdId = imbdId
            self.originalLanguage = originalLanguage
            self.originalTitle = originalTitle
            self.overview = overview
            self.popularity = popularity
            self.posterPath = posterPath
            self.productionCompanies.append(objectsIn: productionCompanies)
            self.productionCountries.append(objectsIn: productionCountries)
            self.releaseDate = releaseDate
            self.revenue = revenue
            self.runtime = runtime
            self.spokenLanguages.append(objectsIn: spokenLanguages)
            self.status = status
            self.tagline = tagline
            self.title = title
            self.video = video
            self.voteAverage = voteAverage
            self.voteCount = voteCount
        }
}


