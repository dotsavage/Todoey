//
//  Category.swift
//  Todoey
//
//  Created by sehajpal singh on 01/09/18.
//  Copyright © 2018 sehajpal singh. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    
    let items = List<Item>()
}
