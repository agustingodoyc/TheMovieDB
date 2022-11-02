//
//  UpcomingViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/10/2022.
//

import UIKit

class UpcomingViewController: CheckNetworkConnection {
    
    // MARK: - IBOutles
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    lazy var viewModel = UpcomingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getUseCaseUpcomingMovie {
            self.reloadData()
        }
    }
    
    override func hideContent() {
        collectionView.isHidden = false
    }
}

extension UpcomingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowOfUpcomingMovie()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingCell", for: indexPath) as? UpcomingCell else {
            return UICollectionViewCell()
        }
        let upcomingMovie = viewModel.getUpcomingMovie(indexPath: indexPath.row)
        cell.loadUpcomingMovie(movie: upcomingMovie)
        return cell
    }
}

// MARK: - Delegate
extension UpcomingViewController: ViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}
