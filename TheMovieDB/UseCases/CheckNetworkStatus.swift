//
//  NetworkStatus.swift
//  TheMovieDB
//
//  Created by Angela Lee on 20/10/2022.
//

import Foundation
import UIKit
import Alamofire

class NetworkStatusViewController: UIViewController {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    
    var networkStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetworking()
    }
    
    func isConnectedToInternet() {
        guard ((NetworkReachabilityManager()?.isReachable) == nil) else {
            networkErrorImage.isHidden = false
            return
        }
        networkErrorImage.isHidden = true
    }
    
    func checkNetworking() {
        guard networkStatus == true else {
            networkErrorImage.isHidden = false
            hideContent()
            return
        }
        networkErrorImage.isHidden = true
    }
    
    func hideContent() {}
}
