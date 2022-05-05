//
//  todoDelegate.swift
//  14-observers
//
//  Created by Rave Bizz on 5/4/22.
//

import Foundation

protocol TodoDelegate{
    var todoItems: [String] {get set}
    var setTodoItem: ((String, Bool, Int)-> Void)? {get set}
}
