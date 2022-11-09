//
//  NetworkConnection.swift
//  TheMovieDB
//
//  Created by Angela Lee on 08/11/2022.
//

import Foundation
import Alamofire

class NetworkConnectionUseCase: NetworkConnection {
    func execute() -> Bool {
        guard ((NetworkReachabilityManager()?.isReachable) != nil) else {
            return false
        }
        return true
    }
}

