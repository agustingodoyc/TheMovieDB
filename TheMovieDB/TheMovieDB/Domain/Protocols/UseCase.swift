//
//  UseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

protocol TabBarUseCase {
    var delegate
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}

protocol DetailsUseCase {
    func execute(movieId: String, completionHandler: @escaping (MovieDetail) -> Void)
}

protocol NetworkConnection {
    func execute() -> Bool
}

protocol UseCaseDelegate {
    func updateMovie(data: [Movie])
}
