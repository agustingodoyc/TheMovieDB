//
//  Protocols .swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

protocol DataBase {
    var isEmpty: Bool { get }
    func persistData(data: [Movie])
    func getData() -> [Movie]
    func clearData()
}
