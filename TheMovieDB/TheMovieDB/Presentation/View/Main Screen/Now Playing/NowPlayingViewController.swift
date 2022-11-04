//
//  NowPlayingViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 13/10/2022.
//

import UIKit

class NowPlayingViewController: CheckNetworkConnection {
    
    // MARK: - IBOutles
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    lazy var viewModel = NowPlayingViewModel()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getUseCaseNowPlayingMovie {
            self.reloadData()
        }
    }
    
    override func hideContent() {
        collectionView.isHidden = false
    }
} 

// MARK: - UICollectionView Methods
extension NowPlayingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowOfNowPlayingMovie()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "nowPlayingCell", for: indexPath) as? NowPlayingCell else {
            return UICollectionViewCell()
        }
        let nowPlayingMovie = viewModel.getNowPlayingMovie(indexPath: indexPath.row)
        cell.loadNowPlayingMovie(movie: nowPlayingMovie)
        return cell
    }
    

}

// MARK: SelectedMovie

extension NowPlayingViewController {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedPath = collectionView.indexPathsForSelectedItems else {
            return
        }
        viewModel.getMovieSelectedRow(row: selectedPath[indexPath.row].row)
    }
}

// MARK: - Delegate
extension NowPlayingViewController: ViewModelDelegate {
    func reloadData() {
        collectionView.reloadData()
    }
}
