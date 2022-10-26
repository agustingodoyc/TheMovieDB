//
//  DataManager.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation

public class DataManager {
    
    private var service: ServiceProtocol
    var delegate: DataManagerDelegate?
    private var dataBase: DataBase
    
    init (service: ServiceProtocol = AlamofireSP(), dataBase: DataBase = RealmDB()) {
        self.service = service
        self.dataBase = dataBase
    }
    
    func getTopRatedMovie(_ endpoint: Endpoints, completionHandler: @escaping ([Movie]) -> Void) {
        if (dataBase.isEmpty) {
            service.parseMovie(endpoint) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movies):
                        self.dataBase.persistData(movies)
                        completionHandler(movies)
                    case .failure(_):
                        completionHandler([])
                    }
                }
            }
        } else {
            completionHandler(dataBase.getData())
            DispatchQueue.global(qos: .background).async {
                self.service.parseMovie(endpoint) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(let data):
                            self.dataBase.clearData()
                            self.dataBase.persistData(data)
                            self.delegate?.updateData(data)
                        case .failure(_):
                            return
                        }
                    }
                }
            }
        }
    }
}
