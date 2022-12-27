//
//  ServiceProtocol.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

enum ServiceError: Error {
    case emptyData
    case parseError
    case serverError
    case clientError
    case badURL
    case error
    case fileNotFound
}

enum Endpoints: String {
    case topRated = "top_rated"
    case upcoming
    case nowPlaying = "now_playing"
    case popular
}

protocol ServiceProtocol {
    func getEndPointMovie(_ endpoint: Endpoints, completion: @escaping (Result<[MovieData], ServiceError>) -> Void )
    func getMovieDetail(_ id: String, completion: @escaping (Result<MovieDetailData, ServiceError>) -> Void)
}
