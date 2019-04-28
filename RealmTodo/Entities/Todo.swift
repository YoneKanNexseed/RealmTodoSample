//
//  Todo.swift
//  RealmTodo
//
//  Created by yonekan on 2019/04/26.
//  Copyright © 2019 yonekan. All rights reserved.
//

import RealmSwift

class Todo: Object {
    // ID
    @objc dynamic var id: Int = Int()
    // タスクのタイトル
    @objc dynamic var title: String = String()
    // タスクの作成日時
    @objc dynamic var date: Date = Date()
}
