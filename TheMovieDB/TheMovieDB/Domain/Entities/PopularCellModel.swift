//
//  PopularCellModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 29/11/2022.
//

import Foundation
import Alamofire

struct PopularCellModel {
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
    
    init(_ movie: Movie) {
        self.posterPath = movie.posterPath
        self.title = movie.title
    }
}
