//
//  PhoneModel.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import RealmSwift
import Realm
import Foundation
//MARK: Модель товара
class Phone: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var price: Double = 0.0
    @objc dynamic var count: Int = 0
    
   convenience init(name: String, price: Double, count: Int) {
    self.init()
        self.name = name
        self.price = price
        self.count = count
    
    
    }
    
//    required init() {
//        fatalError("init() has not been implemented")
//    }
}
