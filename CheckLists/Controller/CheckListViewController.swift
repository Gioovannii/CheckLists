//
//  ViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/12.
//

import UIKit

class CheckListViewController: UITableViewController {
//    let row0text = "Walk the dog"
//    let row1text = "Brush my teeth"
//    let row2text = "Learn iOS development"
//    let row3text = "Soccer practice"
//    let row4text = "Eat ice cream"
//
//    var row0checked = false
//    var row1checked = true
//    var row2checked = true
//    var row3checked = false
//    var row4checked = true
    
    
        var row0item = CheckListItem()
        var row1item = CheckListItem()
        var row2item = CheckListItem()
        var row3item = CheckListItem()
        var row4item = CheckListItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }
    
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row == 0 {
            label.text = row0item.text
        } else if indexPath.row == 1 {
            label.text = row1item.text
        } else if indexPath.row == 2 {
            label.text = row2item.text
        } else if indexPath.row == 3 {
            label.text = row3item.text
        } else if indexPath.row == 4 {
            label.text =  row4item.text
        }
        configureCell(for: cell, at: indexPath)
        return cell
    }
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if indexPath.row == 0 {
                row0item.checked.toggle()
                
            } else if indexPath.row == 1 {
                row1item.checked.toggle()
                
            } else if indexPath.row == 2 {
                row2item.checked.toggle()
                
            } else if indexPath.row == 3 {
                row3item.checked.toggle()
                
            } else if indexPath.row == 4 {
                row4item.checked.toggle()
            }
            configureCell(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCell(for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0item.checked
        } else if indexPath.row == 1 {
            isChecked = row1item.checked
        } else if indexPath.row == 2 {
            isChecked = row2item.checked
        } else if indexPath.row == 3 {
            isChecked = row3item.checked
        } else if indexPath.row == 4 {
            isChecked = row4item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
}
