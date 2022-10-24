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
    
    init(service: ServiceProtocol = ServiceProvider(urlServer: "https://api.themoviedb.org/3/movie/76341?api_key=eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlOGViZWNkNjM0ODU3ZmY0NzlhNTI0NTU2MjZjNTBmNCIsInN1YiI6IjYzM2Q5M2RhNWFiODFhMDA4MWMyZWUwOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.sv6xJcNCCzFx0HsmIrJUzJxQ5HdtJJg9wJgasB_ZtU8"),
         dataBase: DataBase = RealmDataBase()) {
        self.service = service
        self.dataBase = dataBase
    }
    
    func getTopRatedMovie(completionHandler: @escaping ([Movie]) -> Void) {
        if dataBase.isEmpty {
            service.parseMovie(endPoint: "/top_rated?language=en-US&page=1") { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movie):
                        self.dataBase.persistData(data: movie)
                        completionHandler(movie)
                    case .failure(_):
                        completionHandler([])
                    }
                }
            }
        } else {
            completionHandler(dataBase.getData())
            self.service.parseMovie(endPoint: "/top_rated?language=en-US&page=1") { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let movie):
                        self.dataBase.clearData()
                        self.dataBase.persistData(data: movie)
                        self.delegate?.updateData(movie)
                    case .failure(_):
                        return
                    }
                }
            }
        }
    }
}
