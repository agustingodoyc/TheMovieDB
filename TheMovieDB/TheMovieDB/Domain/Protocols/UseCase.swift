//
//  UseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

protocol TabBarUseCase: AnyObject {
    var delegate: UseCaseDelegate? { get set }
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}

protocol SearchUseCaseProtocol {
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}

protocol DetailsUseCase {
    func execute(movieId: String, completionHandler: @escaping (MovieDetail) -> Void)
}

protocol NetworkConnection {
    func execute() -> Bool
}

protocol UseCaseDelegate: AnyObject {
    func updateMovie(data: [Movie])
}
