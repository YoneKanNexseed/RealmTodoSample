//
//  InputViewController.swift
//  RealmTodo
//
//  Created by yonekan on 2019/04/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var button: UIButton!
    
    var todo: Todo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if todo != nil {
            textField.text = todo?.title
            button.setTitle("更新", for: .normal)
        } else {
            button.setTitle("追加", for: .normal)
        }
    }

    @IBAction func didClickButton(_ sender: UIButton) {
        let todoService = TodoService()
        
        if let title = textField.text {
            if todo == nil {
                todoService.create(title: title)
            } else {
                todoService.update(id: todo!.id, newTitle: title)
            }
            
            navigationController?.popViewController(animated: true)
        } else {
            print("Todoが入力されていません")
        }
    }
    
}
