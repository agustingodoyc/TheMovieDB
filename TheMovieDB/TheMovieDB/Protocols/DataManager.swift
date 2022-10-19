//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

public class DataManager {
    
    private var service: ServiceProvider
    private var dataBase: DataBase
    var delegate: DataManagerDelegate?
    
    init(service: ServiceProtocol = ServiceProvider(urlServer: "https://api.themoviedb.org/3/movie"), dataBase: DataBase = RealmDataBase()) {
        self.service = service as! ServiceProvider
        self.dataBase = dataBase
    }
    
    func getDataMovie(completionHandler: @escaping ([Movie]) -> Void) {
        if !dataBase.isEmpty {
            completionHandler(dataBase.getData())
            self.service.parseMovie() { result in
                DispatchQueue.main.async {
                    switch result {
                    case.success(let movie):
                        self.dataBase.clearData()
                        self.dataBase.persistData(data: movie)
                        self.delegate?.updateData(data: movie)
                    case.failure(_ ):
                        return
                    }
                }
            }
        } else {
            service.parseMovie() { result in
                DispatchQueue.main.async {
                    switch result {
                    case.success(let movie):
                        self.dataBase.persistData(data: movie)
                        completionHandler(movie)
                    case.failure(_ ):
                        completionHandler([])
                    }
                }
            }
        }
    }
}
