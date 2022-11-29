//
//  PopularViewController.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation
import UIKit

class PopularViewController: UIViewController, BaseViewController {
    
    weak var coordinator: MainCoordinator?
    lazy var tableView = UITableView()
    lazy var viewModel = PopularViewModel()
    
    struct Cells {
        static let popularCell = "popularCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        configureTableView()
        viewModel.getUseCasePopularMovie {
            self.reloadData()
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 100
        tableView.register(PopularCell.self, forCellReuseIdentifier: Cells.popularCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PopularViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowOfPopularMovie()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:   Cells.popularCell, for: indexPath) as? PopularCell else {
            return UITableViewCell()
        }
        let popularMovie = viewModel.getPopularMovie(indexPath: indexPath.row)
        cell.loadPopularMovie(movie: popularMovie)
        return cell
    }
}

extension PopularViewController: Storyboarded {
    static func instantiate() -> Self? {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        return storyboard.instantiateViewController(withIdentifier: id) as? Self
    }
}

// MARK: - Delegate
extension PopularViewController: ViewModelDelegate {
    func reloadData() {
        tableView.reloadData()
    }
}
