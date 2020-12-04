//
//  AddItemTableViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/21.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: CheckListItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: CheckListItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    
    // MARK: - properties

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: CheckListItem?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        if let itemToEdit = itemToEdit {
            title = "Edit Item"
            textField.text = itemToEdit.text
            doneBarButton.isEnabled = true
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        guard let text = textField.text else { return }
        
        if let item = itemToEdit {
            item.text = text
            delegate?.itemDetailViewController(self, didFinishEditing: item)
            // It's a good idea to have a reference to their owner as the first parameter
            // To distinguish between tableViews
        } else {
            let item = CheckListItem()
            item.text = text
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
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
