//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

enum ValidateUserResult: Error {
    case userNotFound
}

protocol DataManagerProtocol {
    func getMovie(_ endpoint: Endpoints, completionHandler: @escaping ([MoviePersisted]) -> Void)
}

protocol DataManagerDetailProtocol {
    func getDetail(_ movieId: String, completionHandler: @escaping (MovieDetailData) -> Void)
}

protocol DataManagerSearchProtocol {
    func getAllMovies(completionHandler: @escaping ([MoviePersisted]) -> Void)
}

protocol CreateUserProtocol {
    func createUser(userName: String, password: String) -> Bool
    func checkUserName(userName: String) -> Bool
}

protocol LoginProtocol {
    func validateUser(userName: String, password: String) -> Bool
    func checkUserName(userName: String) -> Bool
}
