//
//  NowPlayingUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation

class NowPlayingUseCase: TabBarUseCaseProtocol {
    // MARK: - Properties
    private var dataManager: DataManager
    private var movies: [MoviePersisted] = []
    weak var delegate: UseCaseDelegate?
    
    // MARK: - Init
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    // MARK: - Fetching function
    func execute(completionHandler: @escaping ([Movie]) -> Void) {
        dataManager.getMovie(Endpoints.nowPlaying) { result in
            DispatchQueue.main.async() {
                completionHandler(result.map({
                    Movie(moviePersisted: $0)
                }))
            }
        }
    }
}

// MARK: - Realm
extension NowPlayingUseCase: DataManagerDelegate {
    func updateData(_ data: [MoviePersisted]) {
        self.delegate?.updateMovie(data: data.map({
            Movie(moviePersisted: $0)
        }))
    }
}
