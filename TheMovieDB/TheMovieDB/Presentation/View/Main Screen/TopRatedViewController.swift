//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 05/10/2022.
//

import UIKit

class TopRatedViewController: UIViewController {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    
    var networkStatus: Bool = false
    
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
