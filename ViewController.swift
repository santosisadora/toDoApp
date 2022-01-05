//
//  ViewController.swift
//  toDoList
//
//  Created by user202443 on 11/18/21.
//  This file was created by Isadora Santos, student number 200449748

import UIKit

class ViewController: UIViewController {
    
    //array to store data
    var toDos = [
        toDo(title: "Study" ),
        toDo(title: "Workout"),
        toDo(title: "Groceries"),
        toDo(title: "Work on Project")
    ]

    @IBOutlet weak var tableView1: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loading toDos array data in tableView1
        tableView1.dataSource = self
        
    }
   
    @IBSegueAction func todoViewcontroller(_ coder: NSCoder) -> TodoViewController? {
        let vc = TodoViewController(coder: coder)
        
       
        //if there is a selected row, get the task from the list of todos and pass it to the todo view controller
        if let indexpath =  tableView1.indexPathForSelectedRow{
            let todo = toDos[indexpath.row]
            vc?.todo = todo
        }
        
        vc?.delegate = self
        
        return vc
    }
    
    //editing option - currently not being used
    @IBAction func startEditing(_ sender: Any) {
        tableView1.isEditing = !tableView1.isEditing
    }
}

extension ViewController:UITableViewDataSource{
    
    //create section for groups of cells
 //   func numberOfSections(in tableView: UITableView) -> Int {
  //      return 1
 //   }
    
    
    //how many rows we want to show in the list - number of tasks in the array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return toDos.count
    }
    
    //what cell should be presented for each index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! CheckTableViewCell
        
        cell.delegate = self
        
        let todos = toDos[indexPath.row]
        
        
        cell.set(title: todos.title, checked: todos.isComplete)
        
        return cell
    }
 }

extension ViewController: CheckTableViewCellDelegate{
    func checkTableViewCell(_ cell: CheckTableViewCell, didChangeCheckState checked: Bool) {
        guard let indexPath = tableView1.indexPath(for: cell)else{
            return
        }
        let todo = toDos[indexPath.row]
        let newTodo = toDo(title: todo.title, isComplete:checked )
        
        toDos[indexPath.row] = newTodo
    }
    
}


extension ViewController: TodoViewControllerDelegate{
    func todoViewController(_ vc: TodoViewController, didSaveTodo todo:toDo) {
        
        //replace old todo
        if let indexPath = tableView1.indexPathForSelectedRow{
            //update
            toDos[indexPath.row] = todo
            tableView1.reloadRows(at: [indexPath], with: .none)
        } //or create a new todo
        else{
            toDos.append(todo)
            tableView1.insertRows(at: [IndexPath(row: toDos.count-1, section: 0)], with: .automatic)
        }
        
      
        dismiss(animated: true, completion: nil)
    }
}

