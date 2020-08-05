//
//  StoreInteractor.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import RealmSwift

protocol StoreInteractorInput {
    func getPhone(index: Int) -> Phone
    var phonesArrayCount: Int { get }
    func deletePhone(phone: Phone)
    func reduceCount(phone: Phone)
}

class StoreInteractor {
    weak var presenter: StoreInteractorOutput?
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
//MARK: Ну тут все и так понятно)
extension StoreInteractor: StoreInteractorInput {
    func reduceCount(phone: Phone) {
        storageManager?.reduceCount(phone)
    }

    func deletePhone(phone: Phone) {
        storageManager?.deleteObject(phone)
    }
    
    var phonesArrayCount: Int {
        get {
            return phones.count
        }       
    }
    
    func getPhone(index: Int) -> Phone {
        let item = phones[index]
        return item
    }
    
}
