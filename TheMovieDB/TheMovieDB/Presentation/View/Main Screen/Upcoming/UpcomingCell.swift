//
//  UpcomingCell.swift
//  TheMovieDB
//
//  Created by Angela Lee on 01/11/2022.
//

import Foundation
import UIKit
import Alamofire

class UpcomingCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var relaseDate: UILabel!
    
    func loadUpcomingMovie(movie: UpcomingCellModel) {
        relaseDate.text = "Release Date: " + (movie.relaseDate ?? "Coming soon")
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
    }
}
