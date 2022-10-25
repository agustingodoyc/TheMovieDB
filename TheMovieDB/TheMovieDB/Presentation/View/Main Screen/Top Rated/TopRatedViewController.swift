//
//  TopRatedViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 17/10/2022.
//

import UIKit

class TopRatedViewController: NetworkStatusViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    lazy var viewModel = TopRatedViewModel()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.fetchData() {
            self.reloadData()
        }
    }
    
    override func hideContent() {
        tableView.isHidden = true
    }
}

// MARK: - Table View
    
extension TopRatedViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "topRatedMovieCell",
                                                       for: indexPath) as? CellView else {
            return UITableViewCell()
        }
        
        cell.loadData(movie: viewModel.getCell(indexPath.row), place: (indexPath.row + 1))
        return cell
    }
}

// MARK: - Delegate

extension TopRatedViewController: ViewModelDelegate {
    
    func reloadData() {
        tableView.reloadData()
    }
}
