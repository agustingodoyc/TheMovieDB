//
//  PopularCell.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/11/2022.
//

import Foundation
import UIKit
import Alamofire

class PopularCell: UITableViewCell {
    
    var poster: UIImageView!
    var title: UILabel!
    
    func loadPopularMovie(movie: PopularCellModel) {
        title.text = movie.title
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
    }
}
