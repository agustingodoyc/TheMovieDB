//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

public class DataManager: DataManagerProtocol {
    
    private var service: ServiceProtocol
    var delegate: DataManagerDelegate?
    private var dataBase: DataBase
    
    init (service: ServiceProtocol = AlamofireSP(), dataBase: DataBase = RealmDB()) {
        self.service = service
        self.dataBase = dataBase
    }
    
    func getMovie(_ endpoint: Endpoints, completionHandler: @escaping ([MoviePersisted]) -> Void) {
        if (dataBase.isEmpty) {
            service.getEndPointMovie(endpoint) { result in
                DispatchQueue.main.async {
                    var moviePersisted: [MoviePersisted]
                    switch result {
                    case .success(let movies):
                        moviePersisted = movies.map { (movieData) -> MoviePersisted in
                                .init(movieData: movieData, movieType: endpoint.rawValue)
                            }
                        self.dataBase.persistData(moviePersisted)
                        completionHandler(moviePersisted)
                    case .failure(_):
                        completionHandler([])
                    }
                }
            }
        } else {
            completionHandler(dataBase.getData())
            DispatchQueue.global(qos: .background).async {
                self.service.getEndPointMovie(endpoint) { result in
                    DispatchQueue.main.async {
                        var moviePersisted: [MoviePersisted]
                        switch result {
                        case .success(let movies):
                            moviePersisted = movies.map { (movieData) -> MoviePersisted in
                                    .init(movieData: movieData, movieType: endpoint.rawValue)
                                }
                            self.dataBase.clearData()
                            self.dataBase.persistData(moviePersisted)
                            self.delegate?.updateData(moviePersisted)
                        case .failure(_):
                            return
                        }
                    }
                }
            }
        }
    }
}
