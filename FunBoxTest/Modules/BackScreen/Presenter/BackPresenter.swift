//
//  BackPresenter.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 03.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import RealmSwift

protocol BackViewOutput {
    func viewIsReady()
    var phonesArray: Results<Phone> { get }
    func switchSegment()
    func addButtonTapped()
    func selectRow(with phone: Phone)
}

protocol BackInteractorOutput: class {
    
}
class BackPresenter {
    weak var view: BackViewInput?
    var interactor: BackInteractorInput?
    var router: BackRouterInput?
    
    init() {
        
    }
}

extension BackPresenter: BackViewOutput {
    func addButtonTapped() {
        router?.openEditorScreen()
    }
    
    func selectRow(with phone: Phone) {
        router?.openEditorScreen(with: phone)
    }
    
    func switchSegment() {
        router?.openStoreScreen()
    }
    
    func viewIsReady() {
        view?.update()
    }
    var phonesArray: Results<Phone> {
        get {
            return realm.objects(Phone.self)
        }
    }
    
}

extension BackPresenter: BackInteractorOutput {
    
    
    
    
}
