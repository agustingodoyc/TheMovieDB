//
//  PopularViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation

class PopularViewModel {
    // MARK: - Properties
    var movies: [Movie] = []
    var popularUseCase: TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(popularUseCase: TabBarUseCase = PopularUseCase()) {
        self.popularUseCase = popularUseCase
    }
    
    func getUseCasePopularMovie(completionHandler: @escaping () -> Void) {
        popularUseCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    func isMoviesEmpty() -> Bool {
        return movies.isEmpty
    }
    
    // MARK: - NowPlayingViewController functions
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
