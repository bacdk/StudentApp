//
//  Student.swift
//  
//
//  Created by Dau Khac Bac on 5/10/17.
//  Copyright © 2017 Dau Khac Bac. All rights reserved.
//

import Foundation

class Student {
    var name: String
    var university: String
    var oldYear: Int
    var description: String
    
    init(name: String, university: String, oldYear: Int, description: String) {
        self.name = name
        self.university = university
        self.oldYear = oldYear
        self.description = description
    }
}
