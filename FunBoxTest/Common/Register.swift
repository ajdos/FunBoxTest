//
//  Register.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
//MARK: Расширение для регистра кастомных ячеек и присвоения каждой уникального идентификатора
extension UITableView {
    
    func register(cellTypes: [UITableViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellReuseIdentifier: reuseIdentifier)
        }
    }
}
