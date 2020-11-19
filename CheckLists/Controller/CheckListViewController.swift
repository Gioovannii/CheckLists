//
//  ViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/12.
//

import UIKit

class CheckListViewController: UITableViewController {

    var items = [CheckListItem]()
        var row0item = CheckListItem()
        var row1item = CheckListItem()
        var row2item = CheckListItem()
        var row3item = CheckListItem()
        var row4item = CheckListItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        var item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        var item2 = CheckListItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        var item3 = CheckListItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)

        
        var item4 = CheckListItem()
        item4.text = "Soccer practice"
        items.append(item4)

        
        var item5 = CheckListItem()
        item5.text = "Eat ice cream"
        items.append(item5)

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
