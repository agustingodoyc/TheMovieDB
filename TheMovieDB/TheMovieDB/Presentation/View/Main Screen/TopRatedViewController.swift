//
//  TopRatedViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 17/10/2022.
//

import Foundation
import UIKit

class TopRatedViewController: UIViewController, NetworkStatus {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    
    var networkStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkNetworking()
    }
}
