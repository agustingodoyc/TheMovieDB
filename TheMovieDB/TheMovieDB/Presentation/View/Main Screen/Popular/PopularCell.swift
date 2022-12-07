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
        poster.image = UIImage(named: "TMDBImage")
        poster.alpha = 0.8
        poster.isOpaque = true
        poster.backgroundColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return poster
    }()
    lazy var title: UILabel = {
        let title = UILabel()
        title.layer.cornerRadius = 10
        title.clipsToBounds = true
        title.numberOfLines = 0
        title.adjustsFontSizeToFitWidth = true
        title.font = .preferredFont(forTextStyle: .title1)
        title.backgroundColor = .white.withAlphaComponent(0.7)
        return title
    }()
    
    lazy var releaseDate: UILabel = {
        let releaseDate = UILabel()
        releaseDate.layer.cornerRadius = 10
        releaseDate.clipsToBounds = true
        releaseDate.numberOfLines = 1
        releaseDate.adjustsFontSizeToFitWidth = true
        releaseDate.textColor = .black.withAlphaComponent(0.5)
        releaseDate.font = .preferredFont(forTextStyle: .title2)
        releaseDate.backgroundColor = .white.withAlphaComponent(0.7)
        return releaseDate
    }()
    
    lazy var voteAverage: UILabel = {
        let voteAverage = UILabel()
        voteAverage.layer.cornerRadius = 7
        voteAverage.clipsToBounds = true
        voteAverage.numberOfLines = 1
        voteAverage.adjustsFontSizeToFitWidth = true
        voteAverage.textColor = .white
        voteAverage.font = .preferredFont(forTextStyle: .title3)
        voteAverage.backgroundColor = UIColor(red: 0.02, green: 0.13, blue: 0.27, alpha: 1)
        return voteAverage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        addSubview(poster)
        setPosterConstrains()
        addSubview(title)
        setTitleConstraints()
        addSubview(releaseDate)
        setReleaseDateConstraints()
        addSubview(voteAverage)
        setVoteAverageConstraints()
        
    }
    
    func setPosterConstrains() {
        poster.translatesAutoresizingMaskIntoConstraints = false
        poster.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        poster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        poster.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        poster.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        poster.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    func setTitleConstraints() {
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: poster.topAnchor, constant: 18).isActive = true
        title.leadingAnchor.constraint(equalTo: poster.leadingAnchor, constant: 18).isActive = true
        title.trailingAnchor.constraint(lessThanOrEqualTo: poster.trailingAnchor, constant: -18).isActive = true
    }
    func setReleaseDateConstraints() {
        releaseDate.translatesAutoresizingMaskIntoConstraints = false
        releaseDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        releaseDate.leadingAnchor.constraint(equalTo: poster.leadingAnchor, constant: 18).isActive = true
        releaseDate.trailingAnchor.constraint(lessThanOrEqualTo: poster.trailingAnchor, constant: -18).isActive = true
    }
    
    func setVoteAverageConstraints() {
        voteAverage.translatesAutoresizingMaskIntoConstraints = false
        voteAverage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
        voteAverage.trailingAnchor.constraint(equalTo: poster.trailingAnchor, constant: -25).isActive = true
    }
    
    func loadPopularMovie(movie: PopularCellModel) {
        title.text = movie.title
        AF.request(movie.posterURL).response { response in
            if let data = response.data {
                self.poster.image = UIImage(data: data)
            }
        }
        releaseDate.text = movie.releaseDate
        voteAverage.text = String(movie.voteAverage ?? 0)
    }
}
