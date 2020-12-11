//
//  AllListsViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/5.
//

import UIKit

class AllListsViewController: UITableViewController {
    
    // MARK: - Properties
    let cellIdentifier = "ChecklistCell"
    var lists = [Checklist]()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        var list = Checklist(name: "Birthdays")
        lists.append(list)
        
        list = Checklist(name: "Groceries")
        lists.append(list)
        
        list = Checklist(name: "Cool Apps")
        lists.append(list)
        
        list = Checklist(name: "To Do")
        lists.append(list)
        
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let checklist = lists[indexPath.row]
        guard let textLabel = cell.textLabel else { return UITableViewCell() }
        textLabel.text = checklist.name
        cell.accessoryType = .detailDisclosureButton
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let checklist = lists[indexPath.row]
        performSegue(withIdentifier: "ShowChecklist", sender: checklist)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as? CheckListViewController
            controller?.checklist = sender as? Checklist
        }
    }
}
