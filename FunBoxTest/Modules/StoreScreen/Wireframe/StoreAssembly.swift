//
//  StoreAssembly.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class StoreAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = StoreViewController()
        let dataProvider = StoreDataProvider()
        let presenter = StorePresenter(dataProvider: dataProvider)
        let interactor = StoreInteractor()
        let router = StoreRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
