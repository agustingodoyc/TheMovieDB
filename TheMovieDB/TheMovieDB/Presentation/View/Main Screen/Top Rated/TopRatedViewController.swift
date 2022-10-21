//
//  TopRatedViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 17/10/2022.
//

import UIKit

class TopRatedViewController: NetworkStatusViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func hideContent() {
        tableView.isHidden = true
    }
}
