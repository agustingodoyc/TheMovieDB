//
//  TabBarViewModelProtocol.swift
//  TheMovieDB
//
//  Created by Angela Lee on 07/11/2022.
//

import Foundation

protocol TabBarViewModelProtocol: AnyObject {
    var coordinator: MainCoordinator? { get set }
}
