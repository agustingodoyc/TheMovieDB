//
//  TabBarviewcontroller.swift
//  TheMovieDB
//
//  Created by Angela Lee on 07/11/2022.
//

import Foundation

protocol BaseViewController: AnyObject {
    var coordinator: MainCoordinator? { get set }
}

protocol ProfileBaseController: AnyObject {
    var profileCoordinator: ProfileCoordinator? { get set }
}
