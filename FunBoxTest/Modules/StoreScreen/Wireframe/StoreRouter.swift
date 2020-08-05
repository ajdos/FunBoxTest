//
//  StoreRouter.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol StoreRouterInput {
    func openBackScreen()
    func openEditorScreen()
}

class StoreRouter {
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}

extension StoreRouter: StoreRouterInput {
    func openBackScreen() {
        transition?.push(moduleType: BackAssembly.self, animated: false)
    }
    func openEditorScreen() {
        transition?.push(moduleType: EditorAssembly.self)
    }
    
}
