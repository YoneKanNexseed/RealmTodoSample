//
//  TodoRepository.swift
//  RealmTodo
//
//  Created by yonekan on 2019/04/26.
//  Copyright © 2019 yonekan. All rights reserved.
//
import RealmSwift

class TodoRepository {
    // Todoを新規作成する
    func create(todo: Todo) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(todo)
        }
    }
    
    // Todoの最大IDを取得する
    func getMaxId() -> Int {
        let realm = try! Realm()
        let maxId = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
        
        return maxId
    }
    
    // Todoを全件取得する
    func findAll() -> [Todo] {
        let realm = try! Realm()
        let todos = realm.objects(Todo.self)
        return todos.reversed()
    }
    
    // Todoを更新する
    func update(newTodo: Todo) {
        let realm = try! Realm()
        let todo = findById(id: newTodo.id)
        try! realm.write {
            todo?.title = newTodo.title
            todo?.date = newTodo.date
        }
    }
    
    // idを元にTodoを1件取得する
    func findById(id: Int) -> Todo! {
        let realm = try! Realm()
        let todo = realm.objects(Todo.self).filter("id = \(id)").first
        return todo
    }
    
    func delete(id: Int) {
        let realm = try! Realm()
        let todo = findById(id: id)
        
        try! realm.write {
            realm.delete(todo!)
        }
    }
}
