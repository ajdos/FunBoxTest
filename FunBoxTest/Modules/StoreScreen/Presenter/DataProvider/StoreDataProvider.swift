//
//  StoreDataProvider.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
//MARK: Класс отвечает за то, какие данные должны распологаться в ячейках
protocol StoreDataProviderInput {
    func createViewModel(data: Phone) -> StoreViewModel
}

final class StoreDataProvider: StoreDataProviderInput {
    
    typealias nameCellConfigurator = TableCellConfigurator<NameCell, NameCell.DataType>
    typealias priceCellConfigurator = TableCellConfigurator<PriceCell, PriceCell.DataType>
    typealias countCellConfigurator = TableCellConfigurator<CountCell, CountCell.DataType>
    
    
    func createViewModel(data: Phone) -> StoreViewModel {
        var rows: [StoreViewModel.Row] = []
        if data.name != "" {
            rows.append(.name(configurator: nameCellConfigurator(item: data)))
        }
        rows.append(.price(configurator: priceCellConfigurator(item: data)))
        rows.append(.count(configurator: countCellConfigurator(item: data)))
        return StoreViewModel(rows: rows)
    }
    
    
}
