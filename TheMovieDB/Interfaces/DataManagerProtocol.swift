//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 31/10/2022.
//

import Foundation

protocol DataManagerProtocol {
    func getMovie(_ endpoint: Endpoints, completionHandler: @escaping ([MoviePersisted]) -> Void)
}
    


