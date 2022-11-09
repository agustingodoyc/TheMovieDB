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
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8",
            "language": "en-US",
            "page": "1"
        ]
        static let headerDetails: HTTPHeaders = [
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8",
            "language": "en-US"
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
    
    func getEndPointMovie(_ endpoint: Endpoints, completion: @escaping (Result<[MovieData], ServiceError>) -> Void) {
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
    
    func getMovieDetails(_ id: String, completion: @escaping (Result<MovieDetailData, ServiceError>) -> Void) {
        manager.request(
            ServiceConstants.url + id, method: .get, headers: ServiceConstants.headerDetails).cURLDescription() {
                description in
                print(description)
            }.validate(
                statusCode: 100..<300).responseDecodable(
                    of: MovieDetailData.self) { response in
                        guard let data = response.value else {
                            return completion(.failure(.parseError))
                        }
                        print(data)
                        return completion(.success(data))
                    }
    }
}
