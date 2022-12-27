//
//  SearchViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/11/2022.
//

import Foundation

class SearchViewModel: SearchViewModelProtocol {
    // MARK: - Properties
    private var movies: [Movie] = []
    private var filterMovie: [Movie] = [] {
        didSet {
            delegate?.reloadData()
        }
    }
    var searchUseCase: UseCaseProtocol
    weak var delegate: ViewModelDelegate?
    
    init(searchUseCase: UseCaseProtocol = SearchUseCase() ) {
        self.searchUseCase = searchUseCase
    }
    
    func getSearchUseCase(completionHandler: @escaping () -> Void) {
        searchUseCase.execute() { movie in
            self.movies = movie
            completionHandler()
        }
    }
    
    // MARK: - SearchViewController functions
    func getNumberOfRowOfMovies() -> Int {
        return filterMovie.count
    }

    func getMovies(indexPath: Int) -> SearchCellModel {
        return .init(filterMovie[indexPath])
    }
}

// MARK: - Filter
extension SearchViewModel {
    func searchMovie(searchText: String) {
        var filteredMovie: [Movie] = []
        guard searchText != "" else {
            filterMovie = []
            return
        }
        for movie in movies {
            guard let movieTitle = movie.title else {
                return
            }
            if movieTitle.lowercased().contains(searchText.lowercased()) {
                filteredMovie.append(movie)
            }
        }
        filterMovie = filteredMovie
    }
}
// MARK: - Coordinator
extension SearchViewModel {
    func getMovieId(row: Int) -> Int {
        guard let movieId = filterMovie[row].id else {
            fatalError("No id.")
        }
        return movieId
    }
}
