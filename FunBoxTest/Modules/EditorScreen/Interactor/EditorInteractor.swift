//
//  EditorInteractor.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import RealmSwift

protocol EditorInteractorInput {
    func saveNewPhone(name: String, price: Double, count: Int)
    func editInStore(_ phone: Phone, name: String, price: Double, count: Int)
}

class EditorInteractor {
    weak var presenter: EditorInteractorOutput?
    var storageManager: StorageManager?
    let realm = try! Realm()
    var phones: Results<Phone> {
        get {
            return realm.objects(Phone.self)
        }
    }
    init() {
        self.storageManager = StorageManager()
    }
}

extension EditorInteractor: EditorInteractorInput {
    func saveNewPhone(name: String, price: Double, count: Int) {
        let newPhone = Phone(name: name, price: price, count: count)
        storageManager?.saveObject(newPhone)
    }
    
    func editInStore(_ phone: Phone, name: String, price: Double, count: Int) {
        storageManager?.changeObject(phone, name: name, price: price, count: count)
    }
    
    
}
