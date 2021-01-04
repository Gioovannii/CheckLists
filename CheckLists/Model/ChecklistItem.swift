//
//  CheckListItem.swift
//  CheckLists
//
//  Created by Giovanni Gaffé on 2020/11/18.
//

import Foundation

class ChecklistItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
    
    func scheduleNotification() {
        if shouldRemind && dueDate > Date() {
            print("We should schedule a notification")
        }
    }
}
