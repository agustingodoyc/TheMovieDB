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
    
    func ShowCollectionViweInformation(_ recived: NowPlayingCellModel) {
        guard let myURL = URL(string: recived.poster) else { return }
        let myRequest = URLRequest(url: myURL)
        UIImageView.load()
        title.text = recived.title
        date.text = recived.date
    }
}
