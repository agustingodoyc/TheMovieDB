//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

class NowPlayingViewModel {
    
    var movies: [Movie] = []
    var nowPlayingUseCase: UseCase
    weak var delegate: ViewModelDelegate?
    weak var coordinator: MainCoordinator?
    
    init(nowPlayingUseCase: UseCase = NowPlayingUseCase()) {
        self.nowPlayingUseCase = nowPlayingUseCase
    }
    
    func getUseCaseNowPlayingMovie(completionHandler: @escaping () -> Void) {
        nowPlayingUseCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    //MARK: - NowPlayingViewController functions
    func getNumberOfRowOfNowPlayingMovie() -> Int {
        return movies.count
    }

    func getNowPlayingMovie(indexPath: Int) -> NowPlayingCellModel {
        return .init(movies[indexPath])
    }
}

extension NowPlayingViewModel {
    func getMovieSelectedRow(row: Int) {
        guard let movie = movies[row].id else {
            return
        }
        coordinator?.goToDetails(movieId: movie)
    }
}
