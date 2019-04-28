//
//  TodoService.swift
//  RealmTodo
//
//  Created by yonekan on 2019/04/26.
//  Copyright © 2019 yonekan. All rights reserved.
//
import Foundation

class TodoService {
    // Todoリポジトリ
    let repository = TodoRepository()
    
    // Todoを新規作成する
    func create(title: String) {
        let todo = Todo()
        let maxId = repository.getMaxId()
        
        todo.id = maxId
        todo.title = title
        todo.date = Date()
        
        repository.create(todo: todo)
    }
    
    // Todoを全件取得する
    func findAll() -> [Todo] {
        return repository.findAll()
    }
    
    // Todoを更新する
    func update(id: Int, newTitle: String) {
        let todo = Todo()
        todo.id = id
        todo.title = newTitle
        
        repository.update(newTodo: todo)
    }
    
    func delete(id: Int) {
        repository.delete(id: id)
    }
}
