//
//  SearchUseCase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/11/2022.
//

import Foundation

class SearchUseCase: UseCaseProtocol {
    // MARK: - Properties
    private var dataManager: DataManager
    
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
    }
    
    func execute(completionHandler: @escaping ([Movie]) -> Void) {
        dataManager.getAllMovies() { result in
            DispatchQueue.main.async() {
                completionHandler(result.map({
                    Movie(moviePersisted: $0)
                }))
            }
        }
    }
}
