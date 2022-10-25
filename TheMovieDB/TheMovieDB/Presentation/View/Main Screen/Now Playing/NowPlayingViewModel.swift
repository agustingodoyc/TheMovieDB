//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

class NowPlayingViewModel {
    
    //MARK: - Properties
    private var movies: [Movie] = []
    private var dataManager: DataManager
    weak var delegate: ViewModelDelegate?
    
    //MARK: - Init
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    //MARK: - Closures
    //var loadTableView: (() -> ())?
    //var refreshTableView: (() -> ())?
    
    // MARK: - Fetching function
    func fetchData(completionHandler: @escaping () -> Void) {
        dataManager.getTopRatedMovie() { result in
            DispatchQueue.main.async() {
                self.movies = result
                completionHandler()
            }
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

// MARK: - Realm
extension NowPlayingViewModel: DataManagerDelegate {
    func updateData(_ data: [Movie]) {
        movies = data
    }
}
