//
//  NowPlayingUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation

class NowPlayingUseCase {
    //var movies: [Movie] = [] En view model
    private var dataManager: DataManager
    
    //MARK: - Init
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    // MARK: - Fetching function
    func execute(completionHandler: @escaping ([MovieNowPlaying]) -> Void) {
        dataManager.getMovie(Endpoints.nowPlaying) { result in
            DispatchQueue.main.async() {
                completionHandler(result.map({
                    MovieNowPlaying(moviePersisted: $0)
                }))
            }
        }
    }
}

// MARK: - Realm
extension NowPlayingUseCase: DataManagerDelegate {
    func updateData(_ data: [MoviePersisted]) {
        //movies = data
    }
}


