//
//  Movie.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation

class Movie {
    var title: String?
    var posterPath: String?
    var realeaseDate: String?
    var voteAverage: Double?
    
    convenience init(moviePersisted: MoviePersisted) {
        self.init()
        title = moviePersisted.title
        posterPath = moviePersisted.posterPath
        realeaseDate = moviePersisted.releaseDate
        voteAverage = moviePersisted.voteAverage
    }
}
