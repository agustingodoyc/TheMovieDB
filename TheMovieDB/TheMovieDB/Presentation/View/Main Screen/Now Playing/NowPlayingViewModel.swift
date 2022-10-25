//
//  NowPlayingViewModel.swift
//  TheMovieDB
//
//  Created by Angela Lee on 21/10/2022.
//

import Foundation

class NowPlayingViewModel {
    
    //MARK: - Properties
    private var movie: [Movie] = [
        Movie(posterPath: "",
              adult: false,
              overview: "overview1",
              relaseDate: "20/10/2022",
              genreIds: ["Hi","Bye"],
              id: 1,
              originalTitle: "Hello",
              originalLanguage: "English",
              title: "Hola",
              backdropPath: "",
              popularity: 1,
              voteCount: 1,
              video: true,
              voteAverage: 10),
        Movie(posterPath: "",
              adult: false,
              overview: "overview1",
              relaseDate: "20/10/2022",
              genreIds: ["Hi","Bye"],
              id: 1,
              originalTitle: "Hello2",
              originalLanguage: "English",
              title: "Hola2",
              backdropPath: "",
              popularity: 1,
              voteCount: 1,
              video: true,
              voteAverage: 10),
        Movie(posterPath: "",
              adult: false,
              overview: "overview1",
              relaseDate: "20/10/2022",
              genreIds: ["Hi","Bye"],
              id: 1,
              originalTitle: "Hello2",
              originalLanguage: "English",
              title: "Hola2",
              backdropPath: "",
              popularity: 1,
              voteCount: 1,
              video: true,
              voteAverage: 10)]
    //private var manager: DataManager
    
    //MARK: - Init
    /*init(dataManager: DataManager = DataManager()) {
        manager = dataManager
        self.manager.delegate = self
    }*/
    
    //MARK: - Closures
    //var loadTableView: (() -> ())?
    //var refreshTableView: (() -> ())?
    
    // MARK: - Fetching function
    /*func fetchData() {
        manager.getDataMovie() { movie in
            self.loadTableView?()
            self.movie = movie
        }
    }*/
    
    //MARK: - NowPlayingViewController functions
    func getNumberOfRowOfNowPlayingMovie() -> Int {
        return movie.count
    }

    func getNowPlayingMovie(indexPath: Int) -> NowPlayingCellModel {
        return .init(movie: movie[indexPath])
    }
}

/*extension NowPlayingViewModel: DataManagerDelegate {
    func updateData(data: [Movie]) {
        self.movie = data
    }
}*/
