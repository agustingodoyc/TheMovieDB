//
//  Movie.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation

class MovieNowPlaying {
    var originalTitle: String?
    var path: String?
    
    convenience init(moviePersisted: MoviePersisted) {
        self.init()
        originalTitle = moviePersisted.originalTitle
        path = moviePersisted.posterPath
    }
}
