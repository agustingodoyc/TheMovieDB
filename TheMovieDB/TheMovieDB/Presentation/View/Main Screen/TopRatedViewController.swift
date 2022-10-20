//
//  TopRatedViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 17/10/2022.
//

import Foundation
import UIKit

class TopRatedViewController: UIViewController {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var networkStatus: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        checkNetworking()
    }
    
    func checkNetworking() {
        guard networkStatus == false else {
            networkErrorImage.isHidden = true
            tableView.isHidden = false
            return
        }
        networkErrorImage.isHidden = false
    }
}
