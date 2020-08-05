//
//  ClassName.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
//MARK: вспомогательно расширение для присвоения уникального идентификатора ячейки
extension NSObject {
    
    static var className: String {
        return String(describing: self)
    }
    var className: String {
        return String(describing: type(of: self))
    }
    
}
