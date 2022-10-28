//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

class NowPlayingViewModel {
    
    var movies: [MovieNowPlaying] = []
    var nowPlayingUseCase: NowPlayingUseCase
    weak var delegate: ViewModelDelegate?
    
    init(nowPlayingUseCase: NowPlayingUseCase = NowPlayingUseCase()) {
        self.nowPlayingUseCase = nowPlayingUseCase
    }
    
    func getNowPlayingMovie(completionHandler: @escaping () -> Void) {
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
