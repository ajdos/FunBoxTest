//
//  ModuleTransitionHandler.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
//MARK: Готовые методы для переходов между экранами
protocol ModuleTransitionHandler: AnyObject {
    
    func present<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type)
    func present<ModuleType: Assembly>(moduleType: ModuleType.Type)
    func show<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType)
    func push<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type)
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type)
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type, animated: Bool)
    func pop()
    func popToRootViewController()
    func closeModule()
    func closeNavigationStack()
    func closeNavigationStack(_ completion: (() -> Void)?)
    func closeModule(_ completion: (() -> Void)?)
}

extension UIViewController: ModuleTransitionHandler {
    
    func closeNavigationStack(_ completion: (() -> Void)?) {
        navigationController?.dismiss(animated: true, completion: completion)
    }
    
    func closeNavigationStack() {
        closeNavigationStack(nil)
    }
    
    func present<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        present(view, animated: true, completion: nil)
    }
    
    func present<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule()
        present(view, animated: true, completion: nil)
    }
    
    func show<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType) {
        let view = ModuleType.assembleModule(with: model)
        show(view, sender: nil)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    func popToRootViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func push<ModuleType: Assembly>(with model: TransitionModel, openModuleType: ModuleType.Type) {
        let view = ModuleType.assembleModule(with: model)
        navigationController?.pushViewController(view, animated: true)
    }
    
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type) {
        let view = ModuleType.assembleModule()
        navigationController?.pushViewController(view, animated: true)
    }
    
    func push<ModuleType: Assembly>(moduleType: ModuleType.Type, animated: Bool) {
        let view = ModuleType.assembleModule()
        navigationController?.pushViewController(view, animated: animated)
    }
    
    func closeModule() {
        closeModule(nil)
    }
    
    func closeModule(_ completion: (() -> Void)?) {
        dismiss(animated: true, completion: completion)
    }
    
}
