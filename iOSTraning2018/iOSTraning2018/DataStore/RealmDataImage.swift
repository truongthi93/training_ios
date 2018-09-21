//
//  RealmDataImge.swift
//  iOSTraning2018
//
//  Created by Bao Ngo Mau on 9/21/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class RealmDataImage {
    private var realm : Realm
    static let sharedInstance = RealmDataImage()
    private init() {
        realm = try! Realm()
    }
    
    func saveData(list : [RealmImageModel]) {
        for image in list{
            let item = RealmImageModel()
            item.url = image.url
            item.large_url = image.large_url
            
            do {
                let realm = RealmDataImage.sharedInstance.realm
                do {
                    try? realm.write {
                        realm.add(item)
                    }
                } catch {
                    print("Save fail")
                }
            } catch {
                print("Save fail")
            }
        }
    }
    
    func fetchData() -> [RealmImageModel]? {
        let realm = RealmDataImage.sharedInstance.realm
        var list = realm.objects(RealmImageModel.self)
        return list.toArray(ofType: RealmImageModel.self)
    }
    
    func deleteData() {
        let realm = RealmDataImage.sharedInstance.realm
        let items = realm.objects(RealmImageModel.self)
        try! realm.write {
            realm.delete(items)
        }
    }
}

extension Results {
    func toArray<T>(ofType: T.Type) -> [T] {
        let array = Array(self) as! [T]
        return array
    }
}
