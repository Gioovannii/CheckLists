//
//  Checklist.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/12/9.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var iconName = "No icon"
    var items = [ChecklistItem]()
    
    init(name: String, iconName: String = "No Icon") {
        self.name = name
        self.iconName = iconName
        super.init()
    }
    
    func countUncheckedItems() -> Int {
        var count = 0
        for item in items where !item.checked {
            count += 1
        }
        return count
    }
}
