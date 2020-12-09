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
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let textLabel = cell.textLabel else { return UITableViewCell() }
        textLabel.text = "List \(indexPath.row)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ShowChecklist", sender: nil)
    }
}
