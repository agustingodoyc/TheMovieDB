//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

class NowPlayingViewModel: ViewModel {
    // MARK: - Properties
    var movies: [Movie] = []
    var useCase: TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(nowPlayingUseCase: TabBarUseCase = NowPlayingUseCase()) {
        useCase = nowPlayingUseCase
        useCase.delegate = self
    }
    
    func getUseCaseNowPlayingMovie(completionHandler: @escaping () -> Void) {
        useCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    func isMoviesEmpty() -> Bool {
        return movies.isEmpty
    }
    
    // MARK: - NowPlayingViewController functions
    func getNumberOfRowOfNowPlayingMovie() -> Int {
        return movies.count
    }
    
    func getNowPlayingMovie(indexPath: Int) -> NowPlayingCellModel {
        return .init(movies[indexPath])
    }
}

// MARK: - Coordinator 
extension NowPlayingViewModel {
    func getMovieId(row: Int) -> Int {
        guard let movieId = movies[row].id else {
            fatalError("No id.")
        }
        return movieId
    }
}

// MARK: - UseCaseDelegate
extension NowPlayingViewModel: UseCaseDelegate {
    func updateMovie(data: [Movie]) { }
}
