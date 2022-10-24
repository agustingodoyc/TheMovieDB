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
    private let url: String = "https://api.themoviedb.org/3/movie/76341?api_key=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8"
    
    
    init() {
        self.urlServer = url
        
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            
            return config
        }()
        
        self.manager = Session(configuration: configuration)
    }

    func getMovies(_ completion: @escaping (Result<[Movie], ServiceError>) -> Void) {
        manager.request(self.urlServer).response { responseData in
            guard let data = responseData.data else { return }
            do {
                let movies = try JSONDecoder().decode([Movie].self, from: data)
                completion(.success(movies))
            } catch {
                print(error)
                completion(.failure(.error))
            }
        }
    }
}
