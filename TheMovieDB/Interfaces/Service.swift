//
//  Service.swift
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

protocol ServiceProtocol {
    func parseMovie(completion: @escaping (Result<[Movie], ServiceError>) -> Void )
}
