//
//  CellView.swift
//  TheMovieDB
//
//  Created by Agustin Godoy Cosser on 20/10/2022.
//

import Foundation
import UIKit

class CellView: UITableViewCell {
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var relaseDate: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var voteAverage: UILabel!
    
    func loadData(_ tedTalk: CellModel) {
        
    }
}
