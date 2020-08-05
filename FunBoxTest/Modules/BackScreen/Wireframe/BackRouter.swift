//
//  BackRouter.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 03.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol BackRouterInput {
    func openStoreScreen()
    func openEditorScreen()
    func openEditorScreen(with phone: Phone)
}

class BackRouter {
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

extension BackRouter: BackRouterInput {
    func openEditorScreen(with phone: Phone) {
        transition?.push(with: EditorAssembly.Model(phone: phone), openModuleType: EditorAssembly.self)
    }
    
    func openEditorScreen() {
        transition?.push(moduleType: EditorAssembly.self)
    }
    
    func openStoreScreen() {
        transition?.push(moduleType: StoreAssembly.self, animated: false)
    }
    
    
}
