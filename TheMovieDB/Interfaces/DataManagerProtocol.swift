//
//  DataManagerProtocol.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 26/10/2022.
//

import Foundation

protocol DataManagerProtocol {
    func getData(_ endpoint: Endpoints, completionHandler: @escaping ([Movie]) -> Void)
}
