//
//  ServiceProvider.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import Alamofire

class ServiceProvider: ServiceProtocol {

    private var urlServer: String
    private var manager: Session
    /*private let url: String = "https://api.themoviedb.org/3/movie/76341?api_key=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8"
    private var url: String = "https://api.themoviedb.org/3/movie/top_rated?api_key=<<e8ebecd634857ff479a52455626c50f4>>&language=en-US&page=1"*/
    
    init(urlServer: String) {
        //self.urlServer = url
        self.urlServer = urlServer
        
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            
            return config
        }()
        
        self.manager = Session(configuration: configuration)
    }

    /*func parseMovie(_ completion: @escaping (Result<[Movie], ServiceError>) -> Void) {
        manager.request(self.urlServer, method: .get).response { responseData in
            guard let data = responseData.data else { return }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                print(movies)
                completion(.success(movies))
            } catch {
                print(error)
                completion(.failure(.error))
            }
        }
    }*/
    
    func parseMovie(endPoint: String, completion: @escaping (Result<[Movie], ServiceError>) -> Void) {
        manager.request(self.urlServer + endPoint, method: .get).validate(statusCode: 200..<300).responseDecodable { (response: DataResponse<Movie, AFError>) in
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
