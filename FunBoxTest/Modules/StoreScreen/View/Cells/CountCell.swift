//
//  CountCell.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class CountCell: UITableViewCell {
    
    private var countLabel = UILabel()
    private var quantityStaticLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(countLabel)
        countLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        countLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        quantityStaticLabel.text = "Количество"
        addSubview(quantityStaticLabel)
        quantityStaticLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        quantityStaticLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CountCell: ConfigurableCell {
    
    typealias DataType = Phone
    func configure(data: DataType) {
        self.countLabel.text = "\(data.count) шт."
        contentView.backgroundColor = .white
    }
}
