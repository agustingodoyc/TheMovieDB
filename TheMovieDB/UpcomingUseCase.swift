//
//  UpcomingUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 11/11/2022.
//

import Foundation

class UpcomingUseCase: TabBarUseCase {
    // MARK: - Properties
    private var dataManager: DataManager
    var delegate: UseCaseDelegate?
    
    //MARK: - Init
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    // MARK: - Fetching function
    func execute(completionHandler: @escaping ([Movie]) -> Void) {
        dataManager.getMovie(Endpoints.upcoming) { result in
            DispatchQueue.main.async() {
                completionHandler(result.map({
                    Movie(moviePersisted: $0)
                }))
            }
        }
    }
}

// MARK: - Realm
extension UpcomingUseCase: DataManagerDelegate {
    func updateData(_ data: [MoviePersisted]) {
        self.delegate?.updateMovie(data: data.map({
            Movie(moviePersisted: $0)
        }))
    }
}
