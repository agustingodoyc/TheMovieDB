//
//  ServiceProvider.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import Alamofire

class AlamofireSP: ServiceProtocol {
    
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

    func parseMovie(_ endpoint: Endpoints, completion: @escaping (Result<[Movie], ServiceError>) -> Void) {
        manager.request(
            ServiceConstants.url + endpoint.rawValue, method: .get, headers: ServiceConstants.headers).validate(
                statusCode: 100..<300).responseDecodable(
                    of: MovieList.self) { response in
            guard let data = response.value else {
                return completion(.failure(.parseError))
            }
            
            return completion(.success(Array(data.movieList)))
        }
    }
}
