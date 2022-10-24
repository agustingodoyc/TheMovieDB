//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

public class DataManager {
    
    private var service: ServiceProtocol
    private var dataBase: DataBase
    var delegate: DataManagerDelegate?
    
    init(service: ServiceProtocol = ServiceProvider(),
         dataBase: DataBase = RealmDataBase()) {
        self.service = service
        self.dataBase = dataBase
    }
    
    func getDataMovie(completionHandler: @escaping ([Movie]) -> Void) {
        if dataBase.isEmpty {
            service.getMovies() { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movie):
                        self.dataBase.persistData(movie)
                        completionHandler(movie)
                    case .failure(_):
                        completionHandler([])
                    }
                }
            }
        } else {
            completionHandler(dataBase.getData())
            self.service.getMovies() { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movie):
                        self.dataBase.clearData()
                        self.dataBase.persistData(movie)
                        self.delegate?.updateData(movie)
                    case .failure(_):
                        return
                    }
                }
            }
        }
    }
}
