//
//  NowPlayingCellModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation
import Alamofire

struct NowPlayingCellModel {
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
        self.posterPath = movie.path
        self.title = movie.title
    }
}
