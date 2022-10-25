//
//  ServiceProvider.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import Alamofire

class AlamofireSP: ServiceProtocol {
    enum Endpoints: String {
        case topRated = "top_rated"
        case upcoming
        case nowPlaying = "now_playing"
    }
    
    struct ServiceConstants {
        static let url = "https://api.themoviedb.org/3/movie/"
        
        static let headers: HTTPHeaders = [
            "api_key": "307592d8ff6e24827ce965948687c709",
            "language": "en-US",
            "page": "1"
        ]
    }
    
    private var manager: Session
    
    init() {
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            
            return config
        }()
        
        self.manager = Session(configuration: configuration)
    }

    func parseMovie(completion: @escaping (Result<[Movie], ServiceError>) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=307592d8ff6e24827ce965948687c709&language=en-US&page=1"
        manager.request(/*ServiceConstants.url + Endpoints.topRated.rawValue, method: .get, headers: ServiceConstants.headers*/url).validate(statusCode: 100..<300).responseDecodable(of: MovieList.self) { response in
            guard let data = response.value else {
                return completion(.failure(.parseError))
            }
            
            return completion(.success(Array(data.movieList)))
        }
    }
}
