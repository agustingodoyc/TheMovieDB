//
//  UpcomingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 01/11/2022.
//

import Foundation

class UpcomingViewModel: ViewModel {
    // MARK: - Properties
    var movies: [Movie] = []
    var useCase: TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(upcomingUseCase: TabBarUseCase = UpcomingUseCase()) {
        useCase = upcomingUseCase
        useCase.delegate = self
    }
    
    func getUseCaseUpcomingMovie(completionHandler: @escaping () -> Void) {
        useCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    // MARK: - NowPlayingViewController functions
    func getNumberOfRowOfUpcomingMovie() -> Int {
        return movies.count
    }

    func getUpcomingMovie(indexPath: Int) -> UpcomingCellModel {
        return .init(movies[indexPath])
    }
    
    func isMoviesEmpty() -> Bool {
        return movies.isEmpty
    }
}

// MARK: - Coordinator
extension UpcomingViewModel {
    func getMovieId(row: Int) -> Int {
        guard let movieId = movies[row].id else {
            fatalError("No id.")
        }
        return movieId
    }
}

// MARK: - UseCaseDelegate
extension UpcomingViewModel: UseCaseDelegate {
    func updateMovie(data: [Movie]) { }
}
