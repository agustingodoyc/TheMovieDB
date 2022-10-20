//
//  Movie.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import RealmSwift

class Movie: Object, Codable {
    @Persisted var posterPath: URL?
    @Persisted var adult: Bool
    @Persisted var overview: String
    @Persisted var relaseDate: String
    @Persisted var genreIds = List<String>()
    @Persisted var id: Int
    @Persisted var originalTitle: String
    @Persisted var originalLanguage: String
    @Persisted var title: String
    @Persisted var backdropPath: String?
    @Persisted var popularity: Int
    @Persisted var voteCount: Int
    @Persisted var video: Bool
    @Persisted var voteAverage: Int
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case relaseDate = "relase_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
    
    convenience init(
        posterPath: String?,
        adult: Bool,
        overview: String,
        relaseDate: String,
        genreIds: [String],
        id: Int,
        originalTitle: String,
        originalLanguage: String,
        title: String,
        backdropPath: String?,
        popularity: Int,
        voteCount: Int,
        video: Bool,
        voteAverage: Int
    ) {
        self.init()
        self.posterPath = posterPath
        self.adult = adult
        self.overview = overview
        self.relaseDate = relaseDate
        self.genreIds.append(objectsIn: genreIds)
        self.id = id
        self.originalTitle = originalTitle
        self.originalLanguage = originalLanguage
        self.title = title
        self.backdropPath = backdropPath
        self.popularity = popularity
        self.voteCount = voteCount
        self.video = video
        self.voteAverage = voteAverage
    }
}
