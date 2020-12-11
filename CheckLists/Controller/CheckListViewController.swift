//
//  ViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/12.
//

import UIKit

class CheckListViewController: UITableViewController, ItemDetailViewControllerDelegate {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
        
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
        
        saveChecklistItems()
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem) {
        if let index = items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
        
        saveChecklistItems()
    }
    
    var items = [CheckListItem]()
    var row0item = CheckListItem()
    var row1item = CheckListItem()
    var row2item = CheckListItem()
    var row3item = CheckListItem()
    var row4item = CheckListItem()
    
    var checklist: Checklist?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        
        loadChecklistItems()

//        let item1 = CheckListItem()
//        item1.text = "Walk my dog"
//        items.append(item1)
//
//        let item2 = CheckListItem()
//        item2.text = "Program an app"
//        items.append(item2)
//
//        let item3 = CheckListItem()
//        item3.text = "Do some stuff"
//        items.append(item3)
//
//
//        let item4 = CheckListItem()
//        item4.text = "Bla bla bla .."
//        items.append(item4)
        
        guard let name = checklist?.name else { return }
        title = name
        
//        print("Document folder is \(documentsDirectory())")
//        print("Data file is \(dataFilePath())")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddItem" {
            
            guard let controller = segue.destination as? ItemDetailViewController else { return }
            
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            guard let controller = segue.destination as? ItemDetailViewController else { return }
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as? UITableViewCell ?? UITableViewCell()) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    // MARK: - Table view Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckListItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    // MARK: - Table View Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.checked.toggle()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
        saveChecklistItems()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        saveChecklistItems()
    }
    
    // MARK: - Configure
    
    func configureText(for cell: UITableViewCell, with item: CheckListItem) {
        guard let label = cell.viewWithTag(1000) as? UILabel else { return }
        label.text = item.text
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: CheckListItem) {
        guard let label = cell.viewWithTag(1001) as? UILabel else { return }
        
        if item.checked {
            label.text = "√"
        } else {
            label.text = "  "
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveChecklistItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
            
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadChecklistItems() {
        let path = dataFilePath()
        
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([CheckListItem].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
}
