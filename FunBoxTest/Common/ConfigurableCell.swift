//
//  ConfigurableCell.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//
//MARK: протокол отвечающий за наполнение каждой ячейки
protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}
