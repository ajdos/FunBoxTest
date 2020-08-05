//
//  NavBarSettings.swift
//  FunBoxTest
//
//  Created by Айдин Абдурахманов on 04.08.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import UIKit
//MARK: Методы для navigation bar
extension UIViewController {
func setAddBarButtonItem(tintColor: UIColor, target: UIViewController, action: Selector?) {
       let addItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-plus-128"), style: .plain, target: target, action: action)
       addItem.tintColor = tintColor
       navigationItem.rightBarButtonItem = addItem
   }
    func setCustomBackIcon(tintColor: UIColor) {
        let backItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-cancel-64"), style: .plain, target: nil, action: nil)
        backItem.tintColor = tintColor
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        
    }
    func setSaveBarButtonItem(tintColor: UIColor, target: UIViewController, action: Selector?) {
        let saveItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-save-80"), style: .plain, target: target, action: action)
        saveItem.tintColor = tintColor
        navigationItem.rightBarButtonItem = saveItem
    }
}
