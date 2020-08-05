//
//  StorePresenter.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol StoreViewOutput {
    func viewIsReady()
    func nextPhone()
    func previousPhone()
    func buyButtonTapped()
    func switchSegment()
    func needAddPhones()
}
protocol StoreInteractorOutput: class {
    
}

class StorePresenter {
    weak var view: StoreViewInput?
    var interactor: StoreInteractorInput?
    var router: StoreRouterInput?
    var dataProvider: StoreDataProviderInput
    var counter = 0
    
    
    
    init(dataProvider: StoreDataProviderInput) {
        self.dataProvider = dataProvider
    }
}

extension StorePresenter: StoreViewOutput {
   //MARK: Используется в AlertController для перехода на страницу создания товара при отсутсвии в store
    func needAddPhones() {
        router?.openEditorScreen()
    }
    //MARK: Переход на BackScreen
    func switchSegment() {
        router?.openBackScreen()
    }
    //MARK: viewIsReady проверяет наличие элементов в базе данных и передает первый элемент для создания таблицы
    func viewIsReady() {
        print("viewIsReady")
        switch interactor?.phonesArrayCount {
        case 0:
            view?.showAlert()
            break
        default:
            let currentPhone = interactor?.getPhone(index: counter)
            
            guard let phone = currentPhone else { print("Phone is nil"); return }
            print(phone)
            let viewModel = dataProvider.createViewModel(data: phone)
            view?.update(with: viewModel, animation: .none)
        }
    }
    //MARK: Методы вызываемые при свайпе
    func nextPhone() {
        var currentPhone = interactor?.getPhone(index: counter)
        if counter == (interactor!.phonesArrayCount - 1) {
            counter = 0
        } else {
            counter += 1
        }
        currentPhone = interactor?.getPhone(index: counter)
        guard let phone = currentPhone else { print("Phone is nil"); return }
        let viewModel = dataProvider.createViewModel(data: phone)
        view?.update(with: viewModel, animation: .left)
    }
    func previousPhone() {
        var currentPhone = interactor?.getPhone(index: counter)
        
        if counter > 0 {
            counter -= 1
        } else {
            counter = interactor!.phonesArrayCount - 1
        }
        currentPhone = interactor?.getPhone(index: counter)
        guard let phone = currentPhone else { print("Phone is nil"); return }
        let viewModel = dataProvider.createViewModel(data: phone)
        view?.update(with: viewModel, animation: .right)
    }
    //MARK: Метод определяющий что происходит при нажатии на "Купить"
    func buyButtonTapped() {
        
            var currentPhone = interactor?.getPhone(index: counter)
            guard let currentCount = currentPhone?.count else { return }
            if currentCount == 1 {
                
                
                if interactor?.phonesArrayCount == 1 {
                
                    view?.showAlert()
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                        self.interactor?.deletePhone(phone: currentPhone!)
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                        self.interactor?.deletePhone(phone: currentPhone!)
                    }
                    if counter == interactor!.phonesArrayCount {
                        counter = 0
                        
                        currentPhone = interactor?.getPhone(index: counter)
                        guard let phone = currentPhone else { print("Phone is nil"); return }
                        let viewModel = dataProvider.createViewModel(data: phone)
                        view?.update(with: viewModel, animation: .left)
                    } else {
                        currentPhone = interactor?.getPhone(index: counter)
                        guard let phone = currentPhone else { print("Phone is nil"); return }
                        let viewModel = dataProvider.createViewModel(data: phone)
                        view?.update(with: viewModel, animation: .left)
                    }
                    
                    
                }
                
            } else if currentCount > 1 {
                interactor?.reduceCount(phone: currentPhone!)
                
            }
        }
        
        
    }


extension StorePresenter: StoreInteractorOutput {
    
}
