//
//  DetailsViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation
import Alamofire
import UIKit

class DetailViewModel {
    
    // MARK: - Properties
    private var moviesDetail: MovieDetail?
    private var detailsUseCase: DetailsUseCase
    weak var delegate: ViewModelDelegate?
    var backdrop: String {
        return moviesDetail?.backdropURL ?? ""
    }
    var poster: String {
        return moviesDetail?.posterURL ?? ""
    }
    var movieTitle: String {
        return moviesDetail?.title ?? ""
    }
    var overview: String {
        return moviesDetail?.overview ?? ""
    }
    var releaseDate: String {
        return moviesDetail?.releaseDate ?? ""
    }
    var voteAverage: String {
        return String(moviesDetail?.voteAverage ?? 0)
    }
    var status: String {
        return moviesDetail?.status ?? ""
    }
    
    init(detailsUseCase: DetailsUseCase = MovieDetailUseCase(), movieID: String) {
        self.detailsUseCase = detailsUseCase
        
        detailsUseCase.execute(movieId: movieID) { movie in
            self.moviesDetail = movie
            self.delegate?.reloadData()
        }
    }
}
