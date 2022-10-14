//
//  NowPlayingViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/10/2022.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    
    var networkStatus: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetworking()
    }
    
    func checkNetworking() {
        guard networkStatus == false else {
            networkErrorImage.isHidden = true
            return
        }
        networkErrorImage.isHidden = false
    }
}
