//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/21.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: CheckListItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    // MARK: - properties

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        guard let text = textField.text else { return }
        let item = CheckListItem()
        item.text = text
        
        delegate?.addItemViewController(self, didFinishAdding: item)
        // It's a good idea to have a reference to their owner as the first parameter
        // To distinguish between tableViews
    }
    
    // MARK: - Delegate
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let oldText = text
        guard let stringRange = Range(range, in: oldText) else { return false }
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            doneBarButton.isEnabled = false
        } else {
            doneBarButton.isEnabled = true
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
