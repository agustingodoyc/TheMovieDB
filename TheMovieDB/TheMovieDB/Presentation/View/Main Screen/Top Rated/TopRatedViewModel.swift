//
//  TopRatedViewModel.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 21/10/2022.
//

import Foundation

class TopRatedViewModel {
    
    // MARK: - Properties
    
    let dataManager: DataManager
    
    weak var delegate: ViewModelDelegate?
    
    var movies: [Movie] = []
    
    init(_ dataManager: DataManager = DataManager()) {
        self.dataManager = dataManager
        self.dataManager.delegate = self
    }
    
    // MARK: - Methods
    
    func fetchData(completionHandler: @escaping () -> Void) {
        dataManager.getTopRatedMovie() { result in
            DispatchQueue.main.async() {
                self.movies = result
                completionHandler()
            }
        }
    }
}

// MARK: - Table View

extension TopRatedViewModel {
    func getNumberOfRows() -> Int {
        return self.movies.count
    }
    
    func getMovie(_ index: Int) -> Movie {
        return movies[index]
    }
    
    func getCell(_ index: Int) -> CellModel {
        return .init(getMovie(index))
    }
}

// MARK: - Realm

extension TopRatedViewModel: DataManagerDelegate {
    func updateData(_ data: [Movie]) {
        movies = data
    }
}
