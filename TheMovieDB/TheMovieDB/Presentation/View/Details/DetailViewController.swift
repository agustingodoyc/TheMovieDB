//
//  DetailsViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 04/11/2022.
//

import Foundation
import UIKit
import Alamofire

class DetailViewController: UIViewController {
    // MARK: - OBOutles
    @IBOutlet weak var backdrop: UIImageView!
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    // MARK: - Properties
    weak var viewModel: DetailViewModel?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.delegate = self
    }
}

// MARK: - Storyboarded
extension DetailViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "DetailsScreen", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}

// MARK: - Delegate
extension DetailViewController: ViewModelDelegate {
    func reloadData() {
        guard let backdrop = viewModel?.backdrop else {
            return
        }
        AF.request(backdrop).response { data in
            guard let image = data.data else {
                return
            }
            self.backdrop.image = UIImage(data: image)
        }
        guard let poster = viewModel?.poster else {
            return
        }
        AF.request(poster).response { data in
            guard let image = data.data else {
                return
            }
            self.poster.image = UIImage(data: image)
        }
        self.movieTitle.text = viewModel?.movieTitle
        self.overview.text = viewModel?.overview
        self.releaseDate.text = "Release Date: " + (viewModel?.releaseDate ?? "")
        self.voteAverage.text = "Vote Average: " + (viewModel?.voteAverage ?? "")
        self.navigationItem.title = viewModel?.movieTitle
    }
}
