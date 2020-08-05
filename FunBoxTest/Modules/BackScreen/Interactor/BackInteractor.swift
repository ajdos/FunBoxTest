//
//  BackInteractor.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 03.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import RealmSwift

protocol BackInteractorInput {
    
    
}

class BackInteractor {
    weak var presenter: BackInteractorOutput?
    var storageManager: StorageManager?
    let realm = try! Realm()
    
    init() {
        self.storageManager = StorageManager()
    }
    
}

extension BackInteractor: BackInteractorInput {
    
    
    
}
