//
//  PopularUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation

class PopularUseCase: TabBarUseCase {

    // MARK: - Properties
    private var dataManager: DataManager
    
    // MARK: - Init
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    // MARK: - Fetching function
    func execute(completionHandler: @escaping ([Movie]) -> Void) {
        dataManager.getMovie(Endpoints.popular) { result in
            DispatchQueue.main.async() {
                completionHandler(result.map({
                    Movie(moviePersisted: $0)
                }))
            }
        }
    }
}

// MARK: - Realm
extension PopularUseCase: DataManagerDelegate {
    func updateData(_ data: [MoviePersisted]) {
        //movies = data
    }
}
