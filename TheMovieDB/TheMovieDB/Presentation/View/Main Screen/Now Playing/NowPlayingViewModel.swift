//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

class NowPlayingViewModel {
    
    //MARK: - Properties
    private var movie: [Movie] = []
    private var manager: DataManager
    
    //MARK: - Init
    init(dataManager: DataManager = DataManager()) {
        manager = dataManager
        self.manager.delegate = self
    }
    
    //MARK: - Closures
    var loadTableView: (() -> ())?
    var refreshTableView: (() -> ())?
    
    // MARK: - Fetching funtion
    func fetchData() {
        manager.getDataMovie() { movie in
            self.loadTableView?()
            self.movie = movie
        }
    }
    
    //MARK: - NowPlayingViewController funtions
    func getNumberOfRowOfNowPlayingMovie() -> Int {
        return movie.count
    }

    func getNowPlayingMovie(indexPath: Int) -> NowPlayingCellModel {
        return .init(movie: movie[indexPath])
    }
}

extension NowPlayingViewModel: DataManagerDelegate {
    func updateData(data: [Movie]) {
        self.movie = data
    }
}

