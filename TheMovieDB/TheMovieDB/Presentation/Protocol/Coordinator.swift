//
//  Coordinator.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 12/10/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

protocol MovieDetailProtocol {
    func goToDetail(movieId: Int)
}
