//
//  NowPlayingViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/10/2022.
//

import UIKit

class NowPlayingViewController: UIViewController, NetworkStatus {
   
    @IBOutlet weak var networkErrorImage: UIImageView!
    
    var networkStatus: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetworking()
    }
}
