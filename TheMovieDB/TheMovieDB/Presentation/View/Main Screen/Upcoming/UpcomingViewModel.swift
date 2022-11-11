//
//  UpcomingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 01/11/2022.
//

import Foundation

class UpcomingViewModel {
    
    var movies: [Movie] = []
    var upcomingUseCase: TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(upcomingUseCase: TabBarUseCase = UpcomingUseCase()) {
        self.upcomingUseCase = upcomingUseCase
    }
    
    func getUseCaseUpcomingMovie(completionHandler: @escaping () -> Void) {
        upcomingUseCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    //MARK: - NowPlayingViewController functions
    func getNumberOfRowOfUpcomingMovie() -> Int {
        return movies.count
    }

    func getUpcomingMovie(indexPath: Int) -> UpcomingCellModel {
        return .init(movies[indexPath])
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
