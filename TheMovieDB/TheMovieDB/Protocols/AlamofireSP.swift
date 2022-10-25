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
            "api_key": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8",
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
        manager.request(ServiceConstants.url + Endpoints.topRated.rawValue, method: .get, headers: ServiceConstants.headers).validate(statusCode: 200..<300).responseDecodable(of: [Movie].self) { response in
            guard let data = response.value else {
                return completion(.failure(.parseError))
            }
            return completion(.success(data))
        }
    }
}
