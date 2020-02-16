//
//  TripData.swift
//  MyRealmTest
//
//  Created by 奥山拓弥 on 2020/02/09.
//  Copyright © 2020 奥山拓弥. All rights reserved.
//

import Foundation
import RealmSwift

class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    let age2 = RealmOptional<Int>()
    @objc dynamic var name2 : String? = nil
}
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>()
}
