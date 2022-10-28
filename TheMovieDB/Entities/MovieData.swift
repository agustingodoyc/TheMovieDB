//
//  Movie.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation
import RealmSwift

class MovieData: Object, Codable {
    @Persisted var adult: Bool?
    @Persisted var backdropPath: String?
    @Persisted var genreIDS = List<Int> ()
    @Persisted var id: Int?
    @Persisted var originalLanguage: String?
    @Persisted var originalTitle: String?
    @Persisted var overview: String?
    @Persisted var popularity: Double?
    @Persisted var posterPath: String?
    @Persisted var releaseDate: String?
    @Persisted var title: String?
    @Persisted var video: Bool?
    @Persisted var voteAverage: Double?
    @Persisted var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    convenience init(
        adult: Bool,
        backdropPath: String,
        genreIDS: [Int],
        id: Int,
        originalLanguage: String,
        originalTitle: String,
        overview: String,
        popularity: Double,
        posterPath: String,
        releaseDate: String,
        title: String,
        video: Bool,
        voteAverage: Double,
        voteCount: Int

    ) {
        self.init()
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIDS.append(objectsIn: genreIDS)
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    /*func toMoviePersisted() -> MoviePersisted {
        let aux: MoviePersisted
        
        aux.voteAverage = self.voteAverage
        aux.posterPath = self.posterPath
        aux.title = self.title
        aux.originalTitle = self.originalTitle
        aux.adult =  self.adult
        aux.backdropPath = self.backdropPath
        aux.genreIDS = self.genreIDS
        aux.id = self.id
        aux.originalLanguage = self.originalLanguage
        aux.overview = self.overview
        aux.popularity = self.popularity
        aux.releaseDate = self.releaseDate
        aux.video = self.video
        aux.voteCount = self.voteCount
        
        return aux
    }*/
    
}

