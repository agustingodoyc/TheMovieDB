//
//  CheckNetworkConection.swift
//  TheMovieDB
//
//  Created by Angela Lee on 27/10/2022.
//

import Foundation
import UIKit

class CheckNetworkConnection: UIViewController {
    
    @IBOutlet weak var networkErrorImage: UIImageView!
    var networkConnectionUseCase: NetworkConnectionUseCase = NetworkConnectionUseCase()

    override func viewDidLoad() {
        super.viewDidLoad()
        isConnectedToInternet()
    }
    
    func isConnectedToInternet() {
        guard (networkConnectionUseCase.execute() == true) else {
            networkErrorImage.isHidden = false
            return
        }
        networkErrorImage.isHidden = true
    }
    
    func hideContent() { }
}
