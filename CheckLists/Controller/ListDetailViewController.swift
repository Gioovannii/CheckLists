//
//  ListDetailViewController.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/11.
//

import Foundation

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

final class ListDetailViewController {
    
}
