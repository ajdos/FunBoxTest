//
//  EditorViewController.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit

protocol EditorViewInput: class {
    func update(with phone: Phone)
    func showAlert()
}

class EditorViewController: UIViewController {
    
    var presenter: EditorViewOutput?
    var nameStaticLabel = UILabel()
    var priceStaticLabel = UILabel()
    var countStaticLabel = UILabel()
    var nameTextField = UITextField()
    var priceTextField = UITextField()
    var countTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        presenter?.viewIsReady()
        navigationController?.navigationBar.isHidden = false
        

    }
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.navigationBar.isHidden = false
        
    }
    
    @objc private func saveButtonTap(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, let price = priceTextField.text, let count = countTextField.text else { return }
        presenter?.saveButtonTapped(with: name, price: price, count: count)
    }
    
    @objc private func textFieldChanged() {
        if nameTextField.text?.isEmpty == false, priceTextField.text?.isEmpty == false, countTextField.text?.isEmpty == false {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
            
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension EditorViewController: EditorViewInput {
    func showAlert() {
        let alert = UIAlertController(title: "Некорректная информация!", message: "Проверьте введенные данные и попробуйте снова", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
    
    func update(with phone: Phone) {
        nameTextField.text = phone.name
        priceTextField.text = String(phone.price)
        countTextField.text = String(phone.count)
        
    }
    
    
}

extension EditorViewController {
    private func setupSubviews() {
        view.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        setSaveBarButtonItem(tintColor: .black, target: self, action: #selector(saveButtonTap(_:)))
        navigationItem.rightBarButtonItem?.isEnabled = false
        setCustomBackIcon(tintColor: .black)
        
        nameStaticLabel.text = "Название:"
        nameStaticLabel.textAlignment = .left
        nameStaticLabel.font = .boldSystemFont(ofSize: 22)
        nameStaticLabel.baselineAdjustment = .alignCenters
        nameStaticLabel.numberOfLines = 1
        nameStaticLabel.textColor = .black
        view.addSubview(nameStaticLabel)
        nameStaticLabel.autoSetDimension(.height, toSize: 60)
        nameStaticLabel.autoPinEdge(toSuperviewEdge: .top, withInset: self.navigationController!.navigationBar.frame.size.height / 10)
        nameStaticLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        nameStaticLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        nameTextField.placeholder = "Введите наименование"
        nameTextField.backgroundColor = .white
        nameTextField.keyboardType = .default
        nameTextField.autocorrectionType = .no
        nameTextField.borderStyle = .roundedRect
        nameTextField.clearButtonMode = .always
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        view.addSubview(nameTextField)
        nameTextField.autoSetDimension(.height, toSize: 60)
        nameTextField.autoPinEdge(.top, to: .bottom, of: nameStaticLabel, withOffset: 10)
        nameTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        nameTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        priceStaticLabel.text = "Стоимость:"
        priceStaticLabel.textAlignment = .left
        priceStaticLabel.font = .boldSystemFont(ofSize: 22)
        priceStaticLabel.baselineAdjustment = .alignCenters
        priceStaticLabel.numberOfLines = 1
        priceStaticLabel.textColor = .black
        view.addSubview(priceStaticLabel)
        priceStaticLabel.autoSetDimension(.height, toSize: 60)
        priceStaticLabel.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: 15)
        priceStaticLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        priceStaticLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        priceTextField.placeholder = "Введите цену"
        priceTextField.backgroundColor = .white
        priceTextField.keyboardType = .numbersAndPunctuation
        priceTextField.autocorrectionType = .no
        priceTextField.borderStyle = .roundedRect
        priceTextField.clearButtonMode = .always
        priceTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        view.addSubview(priceTextField)
        priceTextField.autoSetDimension(.height, toSize: 60)
        priceTextField.autoPinEdge(.top, to: .bottom, of: priceStaticLabel, withOffset: 10)
        priceTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        priceTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        countStaticLabel.text = "Количество:"
        countStaticLabel.textAlignment = .left
        countStaticLabel.font = .boldSystemFont(ofSize: 22)
        countStaticLabel.baselineAdjustment = .alignCenters
        countStaticLabel.numberOfLines = 1
        countStaticLabel.textColor = .black
        view.addSubview(countStaticLabel)
        countStaticLabel.autoSetDimension(.height, toSize: 60)
        countStaticLabel.autoPinEdge(.top, to: .bottom, of: priceTextField, withOffset: 15)
        countStaticLabel.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        countStaticLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
        
        countTextField.placeholder = "Введите цену"
        countTextField.backgroundColor = .white
        countTextField.keyboardType = .numbersAndPunctuation
        countTextField.autocorrectionType = .no
        countTextField.borderStyle = .roundedRect
        countTextField.clearButtonMode = .always
        countTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        view.addSubview(countTextField)
        countTextField.autoSetDimension(.height, toSize: 60)
        countTextField.autoPinEdge(.top, to: .bottom, of: countStaticLabel, withOffset: 10)
        countTextField.autoPinEdge(toSuperviewEdge: .left, withInset: 8)
        countTextField.autoPinEdge(toSuperviewEdge: .right, withInset: 8)
    }
}
extension EditorViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
