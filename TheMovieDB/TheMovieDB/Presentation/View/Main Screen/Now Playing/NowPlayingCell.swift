//
//  NowPlayingCell.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation
import UIKit

class NowPlayingCell: UICollectionViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func loadNowPlayingMovie(movie: NowPlayingCellModel) {
        title.text = movie.title
        date.text = movie.releaseDate
    }
}
