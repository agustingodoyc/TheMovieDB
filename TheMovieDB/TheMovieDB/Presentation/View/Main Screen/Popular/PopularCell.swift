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
    
    lazy var poster: UIImageView = {
        let poster = UIImageView()
        poster.layer.cornerRadius = 10
        poster.clipsToBounds = true
        return poster
    }()
    lazy var title = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //Funcion setup
        addSubview(poster)
        addSubview(title)
        
        configurateTitle()
        setPosterConstrains()
        setTitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuratePoster() {
        
    }
    
    func configurateTitle() {
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
    }
    
    func setPosterConstrains() {
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        poster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        poster.heightAnchor.constraint(equalToConstant: 80).isActive = true
        poster.widthAnchor.constraint(equalTo: poster.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleConstraints() { // setup
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 20).isActive = true
        title.heightAnchor.constraint(equalToConstant: 80).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func loadPopularMovie(movie: PopularCellModel) {
        title.text = movie.title
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
    }
}
