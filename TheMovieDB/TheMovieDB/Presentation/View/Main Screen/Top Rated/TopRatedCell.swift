//
//  TopRatedCell.swift
//  TheMovieDB
//
//  Created by Angela Lee on 28/10/2022.
//

import Foundation
import UIKit
import Alamofire

class TopRatedCell: UITableViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var relaseDate: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    func loadData(movie: TopRatedCellModel, place: Int) {
        title.text = movie.title
        relaseDate.text = movie.releaseDate
        self.place.text = "#" + String(place)
        voteAverage.text = String(movie.voteAverage ?? 0) + "%"
        AF.request(movie.posterURL).response { data in
            guard let image = data.data else {
                return
            }
            self.poster.contentMode = .scaleAspectFill
            self.poster.image = UIImage(data: image)
        }
    }
}



