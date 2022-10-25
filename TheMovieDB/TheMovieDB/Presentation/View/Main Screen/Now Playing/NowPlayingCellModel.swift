//
//  NowPlayingCellModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

struct NowPlayingCellModel {
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
    let releaseDate: String?
    let title: String?
    
    init(_ movie: Movie) {
        self.posterPath = movie.posterPath
        self.releaseDate = movie.releaseDate
        self.title = movie.title
    }
    /*let poster: String
    let title: String
    let date: String
    
    init(movie: Movie) {
        poster = movie.posterPath ?? ""
        title = movie.originalTitle
        date = movie.relaseDate
    }*/
}
