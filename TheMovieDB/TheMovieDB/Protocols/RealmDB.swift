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
    
    func getData(endPoint: String) -> [MoviePersisted] {
        return Array(realm.objects(MoviePersisted.self).where {
            $0.movieType == endPoint
        })
    }
    
    func getAllData() -> [MoviePersisted] {
        return Array(realm.objects(MoviePersisted.self))
    }
    
    func clearData(endPoint: String) {
        do {
            try realm.write {
                realm.delete(realm.objects(MoviePersisted.self).where {
                    $0.movieType == endPoint
                })
            }
        } catch {
            print(error)
            return
        }
    }
    
    func createUser(_ user: User) -> Bool {
        do {
            try realm.write {
                realm.add(user)
            }
        } catch {
            print(error)
            return false
        }
        return true
    }
    
    func validateUserName(userName: String) -> Bool {
        let user = realm.objects(User.self).where() {
            $0.userName == userName
        }
        guard user.isEmpty else {
           return false
        }
        return true
    }
    
    func validateUser(userName: String, password: String) -> Bool {
        guard realm.objects(User.self).first(where: {
            $0.userName == userName && $0.password == password
        }) != nil else {
            return false
        }
        return true
    }
}
