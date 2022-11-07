//
//  UseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

protocol TabBarUseCase {
    func execute(completionHandler: @escaping ([Movie]) -> Void)
}

protocol DetailsUseCase {
    func execute(movieId: String, completionHandler: @escaping (MovieDetail) -> Void)
}
