//
//  SearchViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/11/2022.
//

import Foundation
import UIKit

class SearchViewController: UIViewController {
    
    
    // MARK: - IBOutles
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    lazy var viewModel = SearchViewModel()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getSearchUseCase {
            self.reloadData()
        }
    }
}

// MARK: - Table View
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "allMovieCell",
                                                       for: indexPath) as? SearchCell else {
            return UITableViewCell()
        }
        cell.loadAllMovies(movie: viewModel.getMovies(indexPath: indexPath.row))
        
        return cell
    }
}

// MARK: - Storyboarded
extension SearchViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "SearchScreen", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}

// MARK: - Delegate
extension SearchViewController: ViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}
