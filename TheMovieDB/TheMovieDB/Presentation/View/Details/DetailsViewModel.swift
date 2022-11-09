//
//  DetailsViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation
import Alamofire
import UIKit

class DetailsViewModel {
    
    private var moviesDetails: MovieDetail?
    private var detailsUseCase: DetailsUseCase
    weak var delegate: ViewModelDelegate?
    var backdrop: String {
        return moviesDetails?.backdropURL ?? ""
    }
    var poster: String {
        return moviesDetails?.posterURL ?? ""
    }
    /*var poster: UIImageView {
        if let moviesDetailsPosterURL = moviesDetails?.posterURL {
             AF.request(moviesDetailsPosterURL).response { response in
                if let data = response.data {
                    return UIImageView(image: UIImage(data: data))
                }
            }
        }
    }*/
    var movieTitle: String {
        return moviesDetails?.title ?? ""
    }
    var overview: String {
        return moviesDetails?.overview ?? ""
    }
    var releaseDate: String {
        return moviesDetails?.releaseDate ?? ""
    }
    var voteAverage: String {
        return String(moviesDetails?.voteAverage ?? 0)
    }
    var status: String {
        return moviesDetails?.status ?? ""
    }
    
    init(detailsUseCase: DetailsUseCase = MovieDetailsUseCase(), movieID: String) { //El execute no va acá es otra función
        self.detailsUseCase = detailsUseCase
        
        detailsUseCase.execute(movieId: movieID) { movie in
            self.moviesDetails = movie
            self.delegate?.reloadData()
        }
        
        /*guard let moviesDetailsBackdropURL = moviesDetails?.backdropURL else {
            return
        }
        AF.request(moviesDetailsBackdropURL).response { response in
            if let data = response.data {
                self.backdrop.image = UIImage(data: data)
            }
        }*/
        /*guard let moviesDetailsPosterURL = moviesDetails?.posterURL else {
            return
        }
        AF.request(moviesDetailsPosterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }*/
    }
}
