//
//  CheckTableViewCell.swift
//  toDoList
//
//  Created by user202443 on 11/18/21.
//  This file was created by Isadora Santos, student number 200449748

import UIKit

protocol CheckTableViewCellDelegate:AnyObject{
    func checkTableViewCell(_ cell:CheckTableViewCell, didChangeCheckState checked: Bool)
}
class CheckTableViewCell: UITableViewCell {

    @IBOutlet weak var checkbox: Checkbox!
    @IBOutlet weak var label: UILabel!
    
    weak var delegate:CheckTableViewCellDelegate?
    
    @IBAction func checked(_ sender: Checkbox) {
        updateChecked()
        delegate?.checkTableViewCell(self, didChangeCheckState: checkbox.checked)
    }
    
    
    func set(title: String, checked:Bool){
        label.text = title
        checkbox.checked = checked
        updateChecked()
    }

    private func updateChecked(){
        let attributedString = NSMutableAttributedString(string:label.text!)
        
        if checkbox.checked {
            attributedString.addAttribute(.strikethroughStyle, value:2, range:NSMakeRange(0,attributedString.length-1))
        }else {
            attributedString.removeAttribute(.strikethroughStyle, range:NSMakeRange(0,attributedString.length-1))
        }
        label.attributedText = attributedString
    }
    

}
