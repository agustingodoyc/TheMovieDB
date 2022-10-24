//
//  RealmDataBase.swift
//  TheMovieDB
//
//  Created by Angela Lee on 19/10/2022.
//

import Foundation
import RealmSwift

public class RealmDataBase: DataBase {
    
    private let realm: Realm
    
    public init() {
       do {
            realm = try Realm()
        } catch {
            print("error: \(error)")
            fatalError("Unable to create an Realm instance")
        }
    }
    
    var isEmpty: Bool {
        return realm.isEmpty
    }
    
    func persistData(data: [Movie]) {
        do {
            try realm.write({
                realm.add(data)
            })
        } catch {
            print("Error: \(error)")
        }
    }
    
    func getData() -> [Movie] {
        return Array(realm.objects(Movie.self))
    }
    
    func clearData() {
        do {
            try realm.write({
                realm.delete(realm.objects(Movie.self))
            })
        } catch {
            print("Error: \(error)")
        }
    }
}
