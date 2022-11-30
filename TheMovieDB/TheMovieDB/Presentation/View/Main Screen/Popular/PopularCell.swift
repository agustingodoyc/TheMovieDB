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
    lazy var title: UILabel = {
        let title = UILabel()
        title.layer.cornerRadius = 10
        title.clipsToBounds = true
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        return title
    }()
    
    lazy var releaseDate: UILabel = {
        let releaseDate = UILabel()
        releaseDate.layer.cornerRadius = 10
        releaseDate.clipsToBounds = true
        releaseDate.numberOfLines = 1
        releaseDate.adjustsFontSizeToFitWidth = true
        return releaseDate
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 6, green: 34, blue: 68, alpha: 1)
        setUpConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstrains() {
        addSubview(poster)
        setPosterConstrains()
        addSubview(title)
        setTitleConstraints()
        addSubview(releaseDate)
        setReleaseDateConstraints()
        
    }
    
    func setPosterConstrains() {
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.backgroundColor = UIColor(red: 6, green: 34, blue: 68, alpha: 1)
        poster.image = UIImage(named: "TMDBImage")
        poster.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        poster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        poster.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        poster.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        poster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        poster.alpha = 0.7
        poster.isOpaque = true
        
    }
    
    func setTitleConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: poster.topAnchor, constant: 18).isActive = true
        title.leadingAnchor.constraint(equalTo: poster.leadingAnchor, constant: 18).isActive = true
        title.trailingAnchor.constraint(lessThanOrEqualTo: poster.trailingAnchor, constant: -18).isActive = true
        title.font = .preferredFont(forTextStyle: .title1)
        title.backgroundColor = .white.withAlphaComponent(0.5)
    }
    func setReleaseDateConstraints() {
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: poster.leadingAnchor, constant: 18).isActive = true
        releaseDate.trailingAnchor.constraint(lessThanOrEqualTo: poster.trailingAnchor, constant: -18).isActive = true
        releaseDate.textColor = .black.withAlphaComponent(0.5)
        releaseDate.font = .preferredFont(forTextStyle: .title2)
        releaseDate.backgroundColor = .white.withAlphaComponent(0.7)
    }
    
    func loadPopularMovie(movie: PopularCellModel) {
        title.text = movie.title
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
        releaseDate.text = movie.releaseDate
    }
}
