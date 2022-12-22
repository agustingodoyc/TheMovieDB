//
//  PopularViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation

class PopularViewModel: ViewModel {
    // MARK: - Properties
    var movies: [Movie] = []
    var useCase: TabBarUseCaseProtocol
    weak var delegate: ViewModelDelegate?
    
    init(popularUseCase: TabBarUseCaseProtocol = PopularUseCase()) {
        useCase = popularUseCase
        useCase.delegate = self
    }
    
    func getUseCasePopularMovie(completionHandler: @escaping () -> Void) {
        useCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    func isMoviesEmpty() -> Bool {
        return movies.isEmpty
    }
    
    // MARK: - PopularViewController functions
    func getNumberOfRowOfPopularMovie() -> Int {
        return movies.count
    }
    
    func getPopularMovie(indexPath: Int) -> PopularCellModel {
        return .init(movies[indexPath])
    }
}

// MARK: - Coordinator
extension PopularViewModel {
    func getMovieId(row: Int) -> Int {
        guard let movieId = movies[row].id else {
            fatalError("No id.")
        }
        return movieId
    }
}

// MARK: - UseCaseDelegate
extension PopularViewModel: UseCaseDelegate {
    func updateMovie(data: [Movie]) { }
}
