//
//  CellModel.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 20/10/2022.
//

import Foundation

class CellModel {
    struct Configuration {
        static let urlAsString = "https://image.tmdb.org/t/p/original"
    }
    
    var posterURL: URL? {
        guard let posterPath = posterPath else {
            return nil
        }
        return URL(string: Configuration.urlAsString + posterPath)
    }
    
    let posterPath: String?
    let relaseDate: String
    let title: String
    let voteAverage: Int
    
    init(_ movie: Movie) {
        self.posterPath = movie.posterPath
        self.relaseDate = movie.relaseDate
        self.title = movie.title
        self.voteAverage = movie.voteAverage
    }
}
