//
//  EditorPresenter.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol EditorViewOutput {
    func viewIsReady()
    func saveButtonTapped(with name: String, price: String, count: String)
}
protocol EditorInteractorOutput: class {
    
}

class EditorPresenter {
    weak var view: EditorViewInput?
    var interactor: EditorInteractorInput?
    var router: EditorRouterInput?
    var phone: Phone?
    
    init() {
        
    }
    
    init(phone: Phone) {
        self.phone = phone
    }
}

extension EditorPresenter: EditorViewOutput {
    func viewIsReady() {
        guard let phone = phone else { return }
        
            view?.update(with: phone)
        
    }
    
    func saveButtonTapped(with name: String, price: String, count: String) {
       
            if phone != nil {
                       guard Double(price) != nil, Int(count) != nil else {
                        self.view?.showAlert()
                           return
                       }
                       let doublePrice = Double(price)!
                       let intCount = Int(count)!
                interactor?.editInStore(phone!, name: name, price: doublePrice, count: intCount)
                router?.returnToBack()
                   } else {
                       guard Double(price) != nil, Int(count) != nil else {
                        view?.showAlert()
                           return
                       }
                       let doublePrice = Double(price)!
                       let intCount = Int(count)!
                interactor?.saveNewPhone(name: name, price: doublePrice, count: intCount)
        }
        
            router?.returnToBack()
            
        
    }
    
    
}
extension EditorPresenter: EditorInteractorOutput {
    
}
