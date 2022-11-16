//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

protocol DataManagerProtocol {
    func getMovie(_ endpoint: Endpoints, completionHandler: @escaping ([MoviePersisted]) -> Void)
}

protocol DataManagerDetailProtocol {
    func getDetail(_ movieId: String, completionHandler: @escaping (MovieDetailData) -> Void)
}

protocol DataManagerSearchProtocol {
    func getAllMovies(completionHandler: @escaping ([MoviePersisted]) -> Void)
}
