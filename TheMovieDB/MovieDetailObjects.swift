//
//  MovieDetailsObjects.swift
//  TheMovieDB
//
//  Created by Angela Lee on 03/11/2022.
//

import Foundation
import RealmSwift

class BelongsToCollection: Object, Codable {
    @Persisted var id: Int?
    @Persisted var name: String?
    @Persisted var posterPath: String?
    @Persisted var backdropPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    convenience init(id: Int, name: String, posterPath: String, backdropPath: String) {
        self.init()
        self.id = id
        self.name = name
        self.posterPath = posterPath
        self.backdropPath = backdropPath
    }
}

class Genres: Object, Codable {
    @Persisted var id: Int?
    @Persisted var name: String?
    
    convenience init(id: Int, name: String) {
        self.init()
        self.id = id
        self.name = name
    }
}

class ProductionCompanies: Object, Codable {
    @Persisted var name: String?
    @Persisted var id: Int?
    @Persisted var logoPath: String?
    @Persisted var originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case id
        case logoPath = "logo_path"
        case originCountry = "origin_country"
    }
    
    convenience init(name: String, id: Int, logoPath: String, originCountry: String) {
        self.init()
        self.name = name
        self.id = id
        self.logoPath = logoPath
        self.originCountry = originCountry
    }
}

class ProductionCountries: Object, Codable {
    @Persisted var iso_3166_1: String?
    @Persisted var name: String?
    
    convenience init(iso_3166_1: String, name: String) {
        self.init()
        self.iso_3166_1 = iso_3166_1
        self.name = name
    }
}

class SpokenLanguages: Object, Codable {
    @Persisted var iso_639_1: String?
    @Persisted var name: String?
    
    convenience init(iso_639_1: String, name: String) {
        self.init()
        self.iso_639_1 = iso_639_1
        self.name = name
    }
}
