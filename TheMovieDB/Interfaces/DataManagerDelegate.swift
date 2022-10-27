//
//  DataManagerDelegate.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 21/10/2022.
//

import Foundation

protocol DataManagerDelegate: AnyObject {
    func updateData(_ data: [MoviePersisted])
}
