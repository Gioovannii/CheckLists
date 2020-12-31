//
//  IconPickerViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/31.
//

import UIKit

protocol IconPickerViewControllerDelegate: class {
    func iconPicker(_ picker: IconPickerViewController, didPick iconName: String)
}

class IconPickerViewController: UITableViewController {
    weak var delegate: IconPickerViewControllerDelegate?
    
    let icons = [ "No icon", "Appointments", "Birthdays", "Chores",
    "Drinks", "Folder", "Groceries", "Inbox", "Photos", "Trips"]

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
}
