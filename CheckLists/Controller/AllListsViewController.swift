//
//  AllListsViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/5.
//

import UIKit

extension AllListsViewController: ListDetailViewControllerDelegate {
    
    // MARK: - List Detail View Controller Delegates
    
    func listDetailViewControllerDidCancel(_ controller: ListDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist) {
        let newRowIndex = lists.count
        lists.append(checklist)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist) {
        if let index = lists.firstIndex(of: checklist) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                cell.textLabel?.text = checklist.name
            }
        }
        navigationController?.popViewController(animated: true)
    }
}

class AllListsViewController: UITableViewController {
    
    
    // MARK: - Properties
    let cellIdentifier = "ChecklistCell"
    var lists = [Checklist]()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        lists.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        guard let controller = storyboard?.instantiateViewController(identifier: "ListDetailViewController") as? ListDetailViewController else { return }
        controller.delegate = self
        
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destination as? CheckListViewController
            controller?.checklist = sender as? Checklist
        } else if segue.identifier == "AddChecklist" {
            let controller = segue.destination as? ListDetailViewController
            controller?.delegate = self
            
        }
    }
}
