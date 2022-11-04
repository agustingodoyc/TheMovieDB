//
//  DetailsViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation

class DetailsViewModel {
    
    var moviesDetails = MovieDetails()
    var detailsUseCase: DetailsUseCase
    
    init(detailsUseCase: DetailsUseCase = MovieDetailsUseCase()) {
        self.detailsUseCase = detailsUseCase
    }
    
    func getMovieDetailsUseCase(movieID: String) {
        detailsUseCase.execute(movieId: movieID) { movie in
            self.moviesDetails = movie
        }
    }
}
