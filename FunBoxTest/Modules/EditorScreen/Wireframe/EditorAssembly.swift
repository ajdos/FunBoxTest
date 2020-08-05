//
//  EditorAssembly.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

final class EditorAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        let view = EditorViewController()
        let presenter = EditorPresenter()
        let interactor = EditorInteractor()
        let router = EditorRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    static func assembleModule(with model: TransitionModel) -> UIViewController {
        
        guard let phoneModel = model as? Model else { return BackAssembly.assembleModule() }
        let view = EditorViewController()
        let presenter = EditorPresenter(phone: phoneModel.phone)
        let interactor = EditorInteractor()
        let router = EditorRouter(transition: view)
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}
extension EditorAssembly {
    struct Model: TransitionModel {
        let phone: Phone
    }

}
