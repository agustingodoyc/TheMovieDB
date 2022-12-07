//
//  SplashScreenViewController.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 12/10/2022.
//

import Foundation
import UIKit
import Lottie

class SplashScreenViewController: UIViewController {
    // MARK: - View Outlets
    @IBOutlet var animationView: LottieAnimationView!
    
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.play { complition in
            if complition {
                self.coordinator?.finishSplashScreen()
            }
        }
    }
}

// MARK: - Storyboard instantiation
extension SplashScreenViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}
