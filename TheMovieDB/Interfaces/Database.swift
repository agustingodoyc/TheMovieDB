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
    func getData(endPoint: String) -> [MoviePersisted]
    func getAllData() -> [MoviePersisted]
    func clearData(endPoint: String)
    func createUser(_ user: User)
    func checkUserName(userName: String) -> Bool
}
