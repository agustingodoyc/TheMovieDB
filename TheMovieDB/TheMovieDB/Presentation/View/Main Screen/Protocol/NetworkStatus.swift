//
//  NetworkStatus.swift
//  TheMovieDB
//
//  Created by Angela Lee on 20/10/2022.
//

import Foundation
import UIKit

protocol NetworkStatus {
    
    var networkStatus: Bool { get set }
    var networkErrorImage: UIImageView! { get set }
    
    func checkNetworking()
}

extension NetworkStatus {
    
    func checkNetworking() {
        guard networkStatus == false else {
            networkErrorImage.isHidden = true
            return
        }
        networkErrorImage.isHidden = false
    }
}
