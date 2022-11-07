//
//  CheckNetworkConection.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation
import UIKit
import Alamofire

class CheckNetworkConnection: UIViewController {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isConnectedToInternet()
    }
    
    func isConnectedToInternet() {
        guard ((NetworkReachabilityManager()?.isReachable) != nil) else {
            networkErrorImage.isHidden = false
            return
        }
        networkErrorImage.isHidden = true
    }
    
    func hideContent() { }
}

