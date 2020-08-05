//
//  StorageManager.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import RealmSwift
//MARK: Менеджер Realm DataBase
let realm = try! Realm()

class StorageManager {
    func changeObject(_ phone: Phone, name: String, price: Double, count: Int) {
        try! realm.write {
            phone.name = name
            phone.price = price
            phone.count = count
        }
    }
    func reduceCount(_ phone: Phone) {
        try! realm.write {
            phone.count -= 1
        }
    } 
    func saveObject(_ phone: Phone) {
        try! realm.write {
            realm.add(phone)
        }
    }
    func deleteObject(_ phone: Phone) {
        try! realm.write {
            realm.delete(phone)
        }
    }
}
