//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/21.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    override func viewDidLoad() { super.viewDidLoad() }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        guard let text = textField.text else { return }
        print("Contents of the text field: \(text)")
        
        navigationController?.popViewController(animated: true)
    }
}
