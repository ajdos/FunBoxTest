//
//  BackTableViewCell.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

class BackTableViewCell: UITableViewCell {

    private var nameLabel = UILabel()
    private var countLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(nameLabel)
        nameLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 10)
        nameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        nameLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 10)
        nameLabel.numberOfLines = 0
        addSubview(countLabel)
        countLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 10)
        countLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        countLabel.autoPinEdge(.left, to: .right, of: nameLabel, withOffset: 8)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(name: String, count: Int) {
        self.nameLabel.text = name
        self.countLabel.text = "\(count) шт."
    }

}
