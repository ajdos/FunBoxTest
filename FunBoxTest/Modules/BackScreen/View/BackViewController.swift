//
//  BackViewController.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 03.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol BackViewInput: class {
    func update()
}

class BackViewController: UIViewController {
    
    var presenter: BackViewOutput?
    var tableView = UITableView()
    var segmentedControll = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter?.viewIsReady()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.hidesBackButton = true
        tableView.reloadData()
    }
    @objc private func addButtonTap(_ sender: UIBarButtonItem) {
        presenter?.addButtonTapped()
    }
    @objc private func segmentChange(_ sender: UISegmentedControl) {
           switch segmentedControll.selectedSegmentIndex {
           case 0: presenter?.switchSegment()
           case 1: break
           default:
               break
           }
           
       }
    
}

extension BackViewController: BackViewInput {
    func update() {
        tableView.reloadData()
    }
    
    
}
extension BackViewController {
   
    private func setupSubviews() {
        view.backgroundColor = .white
        setAddBarButtonItem(tintColor: .black, target: self, action: #selector(addButtonTap(_:)))
        segmentedControll.insertSegment(withTitle: "Store-Front", at: 0, animated: false)
        segmentedControll.insertSegment(withTitle: "Back-End", at: 1, animated: false)
        segmentedControll.selectedSegmentIndex = 1
        segmentedControll.selectedSegmentTintColor = .systemBlue
        segmentedControll.addTarget(self, action: #selector(segmentChange(_:)), for: .valueChanged)
        
        view.addSubview(segmentedControll)
        segmentedControll.autoSetDimension(.height, toSize: 70)
        segmentedControll.autoPinEdge(toSuperviewEdge: .bottom, withInset: 0)
        segmentedControll.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        segmentedControll.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        
        tableView.backgroundColor = .white
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .black
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BackTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        tableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        tableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        tableView.autoPinEdge(.bottom, to: .top, of: segmentedControll, withOffset: 0)
    }
}

extension BackViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.phonesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BackTableViewCell
        guard let phone = presenter?.phonesArray[indexPath.row] else { return UITableViewCell() }
        cell.setupCell(name: phone.name, count: phone.count)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let phone = presenter?.phonesArray[indexPath.row] else { return }
        presenter?.selectRow(with: phone)
    }
}
