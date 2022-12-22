//
//  ProfileViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/12/2022.
//

import Foundation

class ProfileViewModel {
    var loginStatus: Bool = false
    
    func checkStatus() -> Bool {
        guard loginStatus == true else {
            return false
        }
        return true
    }
}
