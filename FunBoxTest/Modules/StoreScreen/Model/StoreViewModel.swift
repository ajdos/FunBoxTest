//
//  StoreViewModel.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit.UIView
//MARK: Модель отображения данных на view
struct StoreViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case name(configurator: TableCellConfiguratorProtocol)
        case price(configurator: TableCellConfiguratorProtocol)
        case count(configurator: TableCellConfiguratorProtocol)
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
            case let .name(configurator): return configurator
            case let .price(configurator): return configurator
            case let .count(configurator): return configurator
            
                
               
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}

