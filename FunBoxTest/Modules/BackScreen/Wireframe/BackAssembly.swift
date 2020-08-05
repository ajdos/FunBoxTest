//
//  BackAssembly.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 03.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class BackAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = BackViewController()
        let presenter = BackPresenter()
        let interactor = BackInteractor()
        let router = BackRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
