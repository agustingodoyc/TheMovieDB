//
//  PopularUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation

class PopularUseCase: TabBarUseCaseProtocol {
    // MARK: - Properties
    private var dataManager: DataManager
    weak var delegate: UseCaseDelegate?
    
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
        self.delegate?.updateMovie(data: data.map({
            Movie(moviePersisted: $0)
        }))
    }
}
