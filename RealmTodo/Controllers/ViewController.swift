//
//  ViewController.swift
//  RealmTodo
//
//  Created by yonekan on 2019/04/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // テーブルに表示するTodoの配列
    var todos: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // RealmにあるTodoを全件取得
        let todoService = TodoService()
        todos = todoService.findAll()
        
        tableView.reloadData()
    }

    @IBAction func didClickAddButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toInputVC", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let todo = todos[indexPath.row]
        
        // セルのタイトルにTodoのタイトルを設定
        cell.textLabel?.text = todo.title
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todos[indexPath.row]
        performSegue(withIdentifier: "toInputVC", sender: todo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toInputVC" {
            let inputVC = segue.destination as! InputViewController
            inputVC.todo = sender as? Todo
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // セルをスワイプし、Deleteが選ばれた場合
            let id = todos[indexPath.row].id
            
            // Realmからた該当Todoを削除
            let todoService = TodoService()
            todoService.delete(id: id)
            
            // 配列から削除
            todos.remove(at: indexPath.row)
            
            // 画面から削除
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

