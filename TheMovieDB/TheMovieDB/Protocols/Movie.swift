//
//  Movie.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import RealmSwift

class Movie: Object, Codable {
    @Persisted var posterPath: String?
    @Persisted var relaseDate: String
    @Persisted var title: String
    @Persisted var voteAverage: Double
    @Persisted var typeOfView: String
    
    enum Types: String {
        case topRated
        case upcoming
        case nowPlaying
    }
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case relaseDate = "relase_date"
        case title
        case voteAverage = "vote_average"
        case typeOfView
    }
    
    convenience init(
        posterPath: String?,
        relaseDate: String,
        title: String,
        voteAverage: Double,
        typeOfView: String
    ) {
        self.init()
        self.posterPath = posterPath
        self.relaseDate = relaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.typeOfView = typeOfView
    }
}
