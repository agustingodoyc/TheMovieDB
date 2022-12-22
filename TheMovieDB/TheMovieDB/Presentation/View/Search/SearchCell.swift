//
//  SearchCell.swift
//  TheMovieDB
//
//  Created by Angela Lee on 14/11/2022.
//

import Foundation
import UIKit
import Alamofire

class SearchCell: UITableViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    func loadAllMovies(movie: SearchCellModel) {
        title.text = movie.title
        overview.text = movie.overview
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
    }
}
