//
//  TopRatedCellModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 11/11/2022.
//

import Foundation

class TopRatedCellModel {
    struct Configuration {
        static let urlAsString = "https://image.tmdb.org/t/p/original"
    }
    
    var posterURL: String {
        guard let posterPath = posterPath else {
            return ""
        }
        return (Configuration.urlAsString + posterPath)
    }
    
    let posterPath: String?
    let releaseDate: String?
    let title: String?
    let voteAverage: Double?
    
    init(_ movie: Movie) {
        self.posterPath = movie.posterPath
        self.releaseDate = movie.realeaseDate
        self.title = movie.title
        self.voteAverage = movie.voteAverage
    }
}
