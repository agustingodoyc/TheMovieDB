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
    
    init(urlServer: String) {
        self.urlServer = urlServer
        
        let configuration: URLSessionConfiguration = {
            let config = URLSessionConfiguration.default
            
            return config
        }()
        
        self.manager = Session(configuration: configuration)
    }

    func parseMovie(_ completion: @escaping (Result<[Movie], ServiceError>) -> Void) {
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
