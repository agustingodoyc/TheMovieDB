//
//  MovieList.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 25/10/2022.
//

import Foundation
import RealmSwift

class MovieList: Object, Codable {
    @Persisted var movieList = List<Movie> ()

    enum CodingKeys: String, CodingKey {
        case movieList = "results"
    }
    
    convenience init(movieList: [Movie]) {
        self.init()
        self.movieList.append(objectsIn: movieList)
    }
}
