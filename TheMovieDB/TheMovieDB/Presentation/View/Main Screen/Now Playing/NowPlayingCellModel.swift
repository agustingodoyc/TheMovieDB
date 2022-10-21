//
//  NowPlayingCellModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

struct NowPlayingCellModel {
    let poster: String
    let title: String
    let date: String
    
    init(movie: Movie) {
        poster = movie.posterPath ?? ""
        title = movie.originalTitle
        date = movie.relaseDate
    }
}
