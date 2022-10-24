//
//  ServiceProvider.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import Alamofire

class ServiceProvider: ServiceProtocol {
    
    
    enum Endpoints: String, CodingKeyRepresentable {
        case topRated = "top_rated"
        case upcoming
        case nowPlaying = "now_playing"
    }
    
    struct ServiceConstants {
        
        static let url = "https://api.themoviedb.org/3/movie/"
        
        static let headers: HTTPHeaders = [
            "api_key": "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8",
            "language": "en-US&page=1"
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
        manager.request(ServiceConstants.url + Endpoints.topRated.codingKey.stringValue, method: .get, headers: ServiceConstants.headers).validate(statusCode: 200..<300).responseDecodable { (response: DataResponse<Movie, AFError>) in
            guard response.error == nil else {
                return completion(.failure(.error))
            }
            guard let data = response.data else { return }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                print(movies)
                completion(.success(movies))
            } catch {
                print(error)
                completion(.failure(.error))
            }
        }
    }
}
