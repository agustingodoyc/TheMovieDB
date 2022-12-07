//
//  ViewModelProtocol.swift
//  TheMovieDB
//
//  Created by Angela Lee on 16/11/2022.
//

import Foundation

protocol SearchViewModelProtocol {
    func getNumberOfRowOfMovies() -> Int
    func getMovies(indexPath: Int) -> SearchCellModel
}
