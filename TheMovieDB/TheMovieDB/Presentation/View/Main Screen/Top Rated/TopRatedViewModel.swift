//
//  TopRatedViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 11/11/2022.
//

import Foundation

class TopRatedViewModel: ViewModel {
    
    // MARK: - Properties
    var movies: [Movie] = []
    var useCase: TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(topRatedUseCase: TabBarUseCase = TopRatedUseCase()) {
        useCase = topRatedUseCase
        useCase.delegate = self
    }
    
    func getTopRatedMovie(completionHandler: @escaping () -> Void) {
        useCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    func isMoviesEmpty() -> Bool {
        return movies.isEmpty
    }
    
    // MARK: - NowPlayingViewController functions
    func getNumberOfRowOfTopRatedMovie() -> Int {
        return movies.count
    }
    
    func getMovie(_ index: Int) -> Movie {
        return movies[index]
    }
    
    func getCell(_ index: Int) -> TopRatedCellModel {
        return .init(getMovie(index))
    }
}

// MARK: - Coordinator
extension TopRatedViewModel {
    func getMovieId(row: Int) -> Int {
        guard let movieId = movies[row].id else {
            fatalError("No id.")
        }
        return movieId
    }
}

// MARK: - UseCaseDelegate
extension TopRatedViewModel: UseCaseDelegate {
    func updateMovie(data: [Movie]) { }
}
