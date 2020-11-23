//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/21.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)

    }
}
