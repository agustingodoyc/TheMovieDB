//
//  SearchCellModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/11/2022.
//

import Foundation

class SearchCellModel {
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
    let title: String?
    let overview: String?
    
    init(_ movie: Movie) {
        self.posterPath = movie.posterPath
        self.title = movie.title
        self.overview = movie.overview
    }
}
