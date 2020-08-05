//
//  TableCellConfigurator.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
//MARK: конфигуратор ячеек
protocol TableCellConfiguratorProtocol {
    
    static var reuseId: String { get }
    func configure(cell: UIView)
    
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: TableCellConfiguratorProtocol where CellType.DataType == DataType, CellType: UITableViewCell {
    
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: DataType

    init(item: DataType) {
        self.item = item
        
    }

    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item)
    }
}
