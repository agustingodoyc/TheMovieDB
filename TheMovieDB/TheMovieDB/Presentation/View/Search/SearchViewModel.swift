//
//  SearchViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/11/2022.
//

import Foundation

class SearchViewModel {
    
    var movies: [Movie] = []
    var searchUseCase : TabBarUseCase
    weak var delegate: ViewModelDelegate?
    
    init(searchUseCase: TabBarUseCase = SearchUseCase()) {
        self.searchUseCase = searchUseCase
    }
    
    func getSearchUseCase(completionHandler: @escaping () -> Void) {
        searchUseCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    //MARK: - SearchViewController functions
    
    func getNumberOfRowOfMovies() -> Int {
        return movies.count
    }

    func getMovies(indexPath: Int) -> SearchCellModel {
        return .init(movies[indexPath])
    }
}
