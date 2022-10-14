//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 05/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var networkError: UIImageView!
    
    var networking: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        networkError.isHidden = true
    }
    
    func checkNetworking() {
        if networking == false {
            networkError.isHidden = false
        }
    }
}
