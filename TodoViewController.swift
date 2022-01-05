//
//  TodoViewController.swift
//  toDoList
//
//  Created by user202443 on 11/30/21.
//  This file was created by Isadora Santos, student number 200449748

import UIKit

protocol TodoViewControllerDelegate: AnyObject{
    func todoViewController(_ vc: TodoViewController ,didSaveTodo:toDo)
}


class TodoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var todo: toDo?
    
    weak var delegate: TodoViewControllerDelegate?

    //when new todo gets set, the text from the textField will pass to the todo title
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = todo?.title
       
    }
    
    //action for button Save, to save new task
    @IBAction func save(_ sender: Any) {
        let todo = toDo(title:textField.text!)
        delegate?.todoViewController(self, didSaveTodo:todo)
    }

}
