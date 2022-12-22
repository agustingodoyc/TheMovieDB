//
//  MovieDetail.swift
//  TheMovieDB
//
//  Created by Angela Lee on 07/11/2022.
//

import Foundation

class MovieDetail {
    struct Configuration {
        static let urlAsString = "https://image.tmdb.org/t/p/original"
    }
    
    var posterURL: String {
        guard let posterPath = posterPath else {
            return ""
        }
        return (Configuration.urlAsString + posterPath)
    }
    
    var backdropURL: String {
        guard let backDropPath = backDropPath else {
            return ""
        }
        return (Configuration.urlAsString + backDropPath)
    }
    
    var backDropPath: String?
    var title: String?
    var posterPath: String?
    var releaseDate: String?
    var voteAverage: Double?
    var status: String?
    var overview: String?
    var id: Int?
    
    convenience init(movieDetailData: MovieDetailData) {
        self.init()
        backDropPath = movieDetailData.backdropPath
        title = movieDetailData.title
        posterPath = movieDetailData.posterPath
        releaseDate = movieDetailData.releaseDate
        voteAverage = movieDetailData.voteAverage
        status = movieDetailData.status
        overview = movieDetailData.overview
        id = movieDetailData.id
    }
}
