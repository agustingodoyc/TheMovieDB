//
//  RealmDB.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import RealmSwift

public class RealmDB: DataBase {
    
    private let realm: Realm
    var isEmpty: Bool { return realm.isEmpty }
    
    public init() {
        do {
            realm = try Realm()
        } catch {
            print("Error \(error)")
            fatalError("Unable to create an Realm instance")
        }
    }
    
    func persistData(_ movies: [MoviePersisted]) {
        do {
            try realm.write {
                realm.add(movies)
            }
        } catch {
            print(error)
            return
        }
    }
    
    func getData() -> [MoviePersisted] {
        return Array(realm.objects(MoviePersisted.self))
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
