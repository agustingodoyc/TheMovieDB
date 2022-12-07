//
//  Movie.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import RealmSwift

class MoviePersisted: MovieData { 
    @Persisted var movieType: String

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
        voteCount: Int,
        movieType: String
    ) {
        self.init(adult: adult, backdropPath: backdropPath, genreIDS: genreIDS, id: id, originalLanguage: originalLanguage, originalTitle: originalTitle, overview: overview, popularity: popularity, posterPath: posterPath, releaseDate: releaseDate, title: title, video: video, voteAverage: voteAverage, voteCount: voteCount)
        self.movieType = movieType
    }
    
    convenience init(movieData: MovieData, movieType: String) {
        self.init()
        self.adult = movieData.adult
        self.backdropPath = movieData.backdropPath
        self.genreIDS = movieData.genreIDS
        self.id = movieData.id
        self.originalLanguage = movieData.originalLanguage
        self.originalTitle = movieData.originalTitle
        self.overview = movieData.overview
        self.popularity = movieData.popularity
        self.posterPath = movieData.posterPath
        self.releaseDate = movieData.releaseDate
        self.title = movieData.title
        self.video = movieData.video
        self.voteAverage = movieData.voteAverage
        self.voteCount = movieData.voteCount
        self.movieType = movieType
    }
}
