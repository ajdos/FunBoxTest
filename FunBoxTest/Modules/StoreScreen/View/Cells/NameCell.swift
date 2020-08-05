//
//  NameCell.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    
    private var nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(nameLabel)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        nameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        nameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NameCell: ConfigurableCell {
    
    typealias DataType = Phone
    func configure(data: DataType) {
        self.nameLabel.text = data.name
        contentView.backgroundColor = .white
    }
}
