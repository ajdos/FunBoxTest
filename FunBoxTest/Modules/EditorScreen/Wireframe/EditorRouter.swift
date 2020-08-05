//
//  EditorRouter.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation

protocol EditorRouterInput {
    func returnToBack()
}

class EditorRouter {
    weak var transition: ModuleTransitionHandler?
    
    init(transition: ModuleTransitionHandler) {
        self.transition = transition
    }
}
extension EditorRouter: EditorRouterInput {
    func returnToBack() {
        transition?.pop()
    }

}
