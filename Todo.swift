//
//  Todo.swift
//  toDoList
//
//  Created by user202443 on 11/18/21.
//  This file was created by Isadora Santos, student number 200449748

import Foundation

struct toDo{
    let title: String
    let isComplete:Bool 
    
    init(title: String, isComplete:Bool = false){
        self.title = title
        self.isComplete = isComplete
    }
}
