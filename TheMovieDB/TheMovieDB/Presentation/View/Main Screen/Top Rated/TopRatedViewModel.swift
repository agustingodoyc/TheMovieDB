//
//  TopRatedViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 11/11/2022.
//

import Foundation

class TopRatedViewModel {
    
    var movies: [Movie] = []
    var topRatedUseCase: TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(topRatedUseCase: TabBarUseCase = TopRatedUseCase()) {
        self.topRatedUseCase = topRatedUseCase
    }
    
    func getTopRatedMovie(completionHandler: @escaping () -> Void) {
        topRatedUseCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    //MARK: - NowPlayingViewController functions
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
