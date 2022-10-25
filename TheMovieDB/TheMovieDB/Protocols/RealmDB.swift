//
//  RealmDB.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import RealmSwift

class RealmDB: DataBase {
    
    private let realm: Realm
    var isEmpty: Bool { return realm.isEmpty }
    
    init() {
        do {
            realm = try Realm()
        } catch {
            print("Error \(error)")
            fatalError("Unable to create an Realm instance")
        }
    }
    
    func persistData(_ movies: [Movie]) {
        do {
            try realm.write {
                realm.add(movies)
            }
        } catch {
            print(error)
            return
        }
    }
    
    func getData() -> [Movie] {
        return Array(realm.objects(Movie.self))
    }
    
    func clearData() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print(error)
            return
        }
    }
}
