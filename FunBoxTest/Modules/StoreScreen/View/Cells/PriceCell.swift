//
//  PriceCell.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class PriceCell: UITableViewCell {
    
    private var priceLabel = UILabel()
    private var costStaticLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(priceLabel)
        priceLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        priceLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        costStaticLabel.text = "Цена"
        addSubview(costStaticLabel)
        costStaticLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        costStaticLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PriceCell: ConfigurableCell {
    
    typealias DataType = Phone
    func configure(data: DataType) {
        self.priceLabel.text = "\(data.price) руб."
        contentView.backgroundColor = .white
    }
}

