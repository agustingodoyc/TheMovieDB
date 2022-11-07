//
//  MovieDetail.swift
//  TheMovieDB
//
//  Created by Angela Lee on 07/11/2022.
//

import Foundation

class MovieDetail {
    var backDropPath: String?
    var title: String?
    var posterPath: String?
    var realeaseDate: String?
    var voteAverage: Double?
    var status: String?
    var overview: String?
    var id: Int?
    
    convenience init(movieDetailData: MovieDetailData) {
        self.init()
        backDropPath = movieDetailData.backdropPath
        title = movieDetailData.title
        posterPath = movieDetailData.posterPath
        realeaseDate = movieDetailData.releaseDate
        voteAverage = movieDetailData.voteAverage
        status = movieDetailData.status
        overview = movieDetailData.overview
        id = movieDetailData.id
    }
}
