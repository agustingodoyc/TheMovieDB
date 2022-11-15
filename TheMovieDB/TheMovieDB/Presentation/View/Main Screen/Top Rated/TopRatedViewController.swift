//
//  TopRatedViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 17/10/2022.
//

import UIKit

class TopRatedViewController: CheckNetworkConnection, BaseViewController {
    
    // MARK: - IBOutles
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    weak var coordinator: MainCoordinator?
    lazy var viewModel = TopRatedViewModel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getTopRatedMovie {
            self.reloadData()
        }
    }
    
    override func hideContent() {
        tableView.isHidden = false
    }
}

// MARK: - Table View
    
extension TopRatedViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowOfTopRatedMovie()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "topRatedMovieCell",
                                                       for: indexPath) as? TopRatedCell else {
            return UITableViewCell()
        }
        
        cell.loadData(movie: viewModel.getCell(indexPath.row), place: (indexPath.row + 1))
        return cell
    }
}

// MARK: SelectedMovie
extension TopRatedViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.goToDetail(movieId: viewModel.getMovieId(row: indexPath.row))
    }
}

// MARK: - Delegate

extension TopRatedViewController: ViewModelDelegate {
    
    func reloadData() {
        tableView.reloadData()
    }
}
