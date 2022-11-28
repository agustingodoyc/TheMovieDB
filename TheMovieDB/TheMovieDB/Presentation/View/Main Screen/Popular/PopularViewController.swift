//
//  PopularViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation
import UIKit

class PopularViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension PopularViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
