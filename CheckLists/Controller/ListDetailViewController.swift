//
//  ListDetailViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/11.
//

import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerDidCancel(
        _ controller: ListDetailViewController)

      func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishAdding checklist: Checklist
      )

      func listDetailViewController(
        _ controller: ListDetailViewController,
        didFinishEditing checklist: Checklist
      )
}

final class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    @IBOutlet var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ListDetailViewControllerDelegate?
    
    var checklistToEdit: Checklist?
    
  
}
