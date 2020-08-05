//
//  ViewController.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 31.07.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
import NeatLayout
import RealmSwift

protocol StoreViewInput: class {
    func update(with viewModel: StoreViewModel, animation: UITableView.RowAnimation)
    func showAlert()
}

class StoreViewController: UIViewController {
    
    var presenter: StoreViewOutput?
    var segmentedControll = UISegmentedControl()
    var buyButton = UIButton()
    var stackView = UIStackView()
    private var tableView = UITableView()
    private var storeViewModel: StoreViewModel?
    var leftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade(_:)))
    var rightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade(_:)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade(_:)))
        let rightRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade(_:)))
        leftRecognizer.direction = .left
        rightRecognizer.direction = .right
        view.addGestureRecognizer(leftRecognizer)
        view.addGestureRecognizer(rightRecognizer)
        setupSubviews()
        presenter?.viewIsReady()
    }
    override func viewWillAppear(_ animated: Bool) {
        hideNavBar()
    }
    
    @objc private func swipeMade(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            presenter?.nextPhone()
        }
        if sender.direction == .right {
            presenter?.previousPhone()
        }
    }
    @objc private func buyButtonTap(_ sender: UIButton) {
        presenter?.buyButtonTapped()
        tableView.reloadData()
    }
    //MARK: Переключение segmented controll
    @objc private func segmentChange(_ sender: UISegmentedControl) {
        switch segmentedControll.selectedSegmentIndex {
        case 0: break
        case 1: presenter?.switchSegment()
        default:
            break
        }
        
    }
    //MARK: Метод используется в showAlert()
    private func tableViewIsEmpty(_ sender: UIAlertAction) {
        presenter?.needAddPhones()
    }
}

extension StoreViewController: StoreViewInput {
    //MARK: Уведомление при пустом складе
    func showAlert() {
        let alert = UIAlertController(title: "Склад пустой!", message: "Перейдите на страницу редактирования и внесите товар", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.tableViewIsEmpty(action)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    //MARK: Метод обновляет View с анимацией после получение новых данных и при свайпе
    func update(with viewModel: StoreViewModel, animation: UITableView.RowAnimation) {
        self.storeViewModel = viewModel
        let sections = IndexSet(integersIn: 0...0)
        tableView.reloadSections(sections, with: animation)
    }
}

extension StoreViewController {
    //MARK: конфигурация интерфейса
    private func setupSubviews() {
        view.backgroundColor = .white
        
        segmentedControll.insertSegment(withTitle: "Store-Front", at: 0, animated: false)
        segmentedControll.insertSegment(withTitle: "Back-End", at: 1, animated: false)
        segmentedControll.selectedSegmentIndex = 0
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
        tableView.register(cellTypes: [NameCell.self, PriceCell.self, CountCell.self])
        tableView.tableFooterView = UIView()
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(stackView)
        view.addSubview(tableView)
        tableView.autoPinEdge(toSuperviewEdge: .top, withInset: 0)
        tableView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        tableView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        tableView.autoPinEdge(.bottom, to: .top, of: stackView, withOffset: 0)
        tableView.autoSetDimension(.height, toSize: ((view.bounds.size.height - segmentedControll.bounds.size.height) / 4) * 3)
        
        stackView.distribution = .fill
        stackView.alignment = .center
        
        stackView.autoSetDimension(.height, toSize: (view.bounds.size.height - segmentedControll.bounds.size.height) / 4)
        stackView.autoPinEdge(.top, to: .bottom, of: tableView, withOffset: 0)
        stackView.autoPinEdge(.bottom, to: .top, of: segmentedControll, withOffset: 0)
        stackView.autoPinEdge(toSuperviewEdge: .left, withInset: 0)
        stackView.autoPinEdge(toSuperviewEdge: .right, withInset: 0)
        
        
        
        buyButton.backgroundColor = .gray
        buyButton.setTitle("Купить", for: .normal)
        buyButton.clipsToBounds = true
        buyButton.layer.cornerRadius = 5
        buyButton.addTarget(self, action: #selector(buyButtonTap(_ :)), for: .touchUpInside)
        stackView.addSubview(buyButton)
        buyButton.autoSetDimensions(to: CGSize(width: 180, height: 40))
        buyButton.autoAlignAxis(toSuperviewAxis: .vertical)
        buyButton.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        
        
        
        
        
        
        
        
    }
    private func hideNavBar() {
        navigationController?.navigationBar.isHidden = true
    }
}
//MARK: реализация протоколов для  tableView
extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeViewModel?.rows.count ?? 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = storeViewModel?.rows[indexPath.row] else {
            print("Failed to init cell in \(className)")
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        row.configurator.configure(cell: cell)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.size.height / 5
    }
    
}

