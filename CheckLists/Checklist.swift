//
//  Checklist.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/9.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [CheckListItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
