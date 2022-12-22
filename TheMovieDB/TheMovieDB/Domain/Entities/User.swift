//
//  User.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/12/2022.
//

import Foundation
import RealmSwift

class User: Object {
    @Persisted var userName: String = ""
    @Persisted var password: String = ""
    
    convenience init(userName: String, password: String) {
        self.init()
        self.userName = userName
        self.password = password
    }
}
