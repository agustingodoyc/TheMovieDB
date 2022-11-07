//
//  DetailsViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation

class DetailsViewModel {
    
    var moviesDetails: MovieDetail?
    var detailsUseCase: DetailsUseCase
    
    init(detailsUseCase: DetailsUseCase = MovieDetailsUseCase(), movieID: String) {
        self.detailsUseCase = detailsUseCase
        detailsUseCase.execute(movieId: movieID) { movie in
            self.moviesDetails = movie
        }
    }
}
