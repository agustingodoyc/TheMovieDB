//
//  Protocols .swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

protocol DataBase {
    var isEmpty: Bool { get }
    func persistData(_ data: [MoviePersisted]) 
    func getData() -> [MoviePersisted]
    func clearData()
}
