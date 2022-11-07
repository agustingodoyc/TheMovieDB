//
//  MovieDetailsUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation

import Foundation

class MovieDetailsUseCase: DetailsUseCase {
    
    private var dataManager: DataManager
    
    //MARK: - Init
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    // MARK: - Fetching function
    func execute(movieId: String, completionHandler: @escaping (MovieDetail) -> Void) {
        dataManager.getDetails(movieId) { result in
            completionHandler(MovieDetail(movieDetailData: result))
        }
    }
}

// MARK: - Realm
extension MovieDetailsUseCase: DataManagerDelegate {
    func updateData(_ data: [MoviePersisted]) {
        //movies = data
    }
}


