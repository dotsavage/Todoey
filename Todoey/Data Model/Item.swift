//
//  Item.swift
//  Todoey
//
//  Created by sehajpal singh on 01/09/18.
//  Copyright © 2018 sehajpal singh. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date? = nil
    
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
    
}
