//
//  NowPlayingCell.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation
import UIKit
import Alamofire

class NowPlayingCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func loadNowPlayingMovie(movie: NowPlayingCellModel) {
        title.text = movie.title
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
    }
}
