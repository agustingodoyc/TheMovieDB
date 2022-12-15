//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

public class DataManager: DataManagerProtocol, DataManagerDetailProtocol, DataManagerSearchProtocol {
    // MARK: - Properties
    private var service: ServiceProtocol
    var delegate: DataManagerDelegate?
    private var dataBase: DataBase
    
    init (service: ServiceProtocol = AlamofireSP(), dataBase: DataBase = RealmDB()) {
        self.service = service
        self.dataBase = dataBase
    }
    
    // MARK: - Get movies
    func getMovie(_ endpoint: Endpoints, completionHandler: @escaping ([MoviePersisted]) -> Void) {
        if (dataBase.getData(endPoint: endpoint.rawValue).isEmpty) {
            service.getEndPointMovie(endpoint) { result in
                DispatchQueue.main.async {
                    var moviePersisted: [MoviePersisted]
                    switch result {
                    case .success(let movies):
                        moviePersisted = movies.map { (movieData) -> MoviePersisted in
                                .init(movieData: movieData, movieType: endpoint.rawValue)
                            }
                        self.dataBase.persistData(moviePersisted)
                        self.delegate?.updateData(moviePersisted)
                        completionHandler(moviePersisted)
                    case .failure(_):
                        completionHandler([])
                    }
                }
            }
        } else {
            completionHandler(dataBase.getData(endPoint: endpoint.rawValue))
            DispatchQueue.global(qos: .background).async {
                self.service.getEndPointMovie(endpoint) { result in
                    DispatchQueue.main.async {
                        var moviePersisted: [MoviePersisted]
                        switch result {
                        case .success(let movies):
                            moviePersisted = movies.map { (movieData) -> MoviePersisted in
                                    .init(movieData: movieData, movieType: endpoint.rawValue)
                                }
                            self.dataBase.clearData(endPoint: endpoint.rawValue)
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
    
    // MARK: - Get Movie Detail
    func getDetail(_ movieId: String, completionHandler: @escaping (MovieDetailData) -> Void) {
        service.getMovieDetail(movieId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let movie):
                    completionHandler(movie)
                case .failure(_):
                    return
                }
            }
        }
    }
    
    // MARK: - Get All Movies
    func getAllMovies(completionHandler: @escaping ([MoviePersisted]) -> Void) {
        if (dataBase.isEmpty) {
            completionHandler([])
        } else {
            completionHandler(dataBase.getAllData())
        }
    }
    
    // MARK: - User
    func createUser(userName: String, password: String) { //Retorn de database.createUser
        let user = User(userName: userName, password: password)
        dataBase.createUser(user)
    }
    
    func checkUserName(userName: String) -> Bool {
        dataBase.checkUserName(userName: userName)
    }
}
