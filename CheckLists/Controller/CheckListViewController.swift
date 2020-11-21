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
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        let item1 = CheckListItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = CheckListItem()
        item2.text = "Brush my teeth"
        item2.checked = true
        items.append(item2)
        
        let item3 = CheckListItem()
        item3.text = "Learn iOS development"
        item3.checked = true
        items.append(item3)

        
        let item4 = CheckListItem()
        item4.text = "Soccer practice"
        items.append(item4)

        
        let item5 = CheckListItem()
        item5.text = "Eat ice cream"
        items.append(item5)

    }
    // MARK: - Actions
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = CheckListItem()
        item.text = "I am a new row"
        item.checked = true
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }

    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, at: indexPath)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

    // MARK: - Configure

    func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
        let item = items[indexPath.row]
        
        if item.checked {
            cell.accessoryType = .checkmark
            
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
}
