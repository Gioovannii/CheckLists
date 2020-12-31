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
}
