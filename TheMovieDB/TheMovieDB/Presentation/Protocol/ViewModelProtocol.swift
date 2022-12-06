//
//  ViewModelProtocol.swift
//  TheMovieDB
//
//  Created by Angela Lee on 16/11/2022.
//

import Foundation

protocol SearchViewModelProtocol {
    func getNumberOfRowOfMovies() -> Int
    func getMovies(indexPath: Int) -> SearchCellModel
}

protocol ViewModel {
    var movies: [Movie] { get set }
    var useCase: TabBarUseCase { get set }
    var delegate: ViewModelDelegate? { get set }
    func updateMovie(data: [Movie])
}

extension ViewModel {
    mutating func updateMovie(data: [Movie]) {
        self.movies = data
    }
}
