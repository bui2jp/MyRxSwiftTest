//
//  MyRealmClass.swift
//  MyRealmTest
//
//  Created by 奥山拓弥 on 2020/02/09.
//  Copyright © 2020 奥山拓弥. All rights reserved.
//

import Foundation
import RealmSwift

class MyRealm {

    static func addDogItem(){
        print("MyRealm:addDogItem")
        
        let myDog = Dog()
        
        myDog.name = "add by static func"
        myDog.name2 = "static name 2"
        myDog.age = 100
        myDog.age2.value = 200
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(myDog)
        }
    }
    
    static func readDogItem(){
        print("MyRealm:readDogItem")
        
        let realm = try! Realm()
        
        let puppies = realm.objects(Dog.self)
        
        print(puppies)
    }
}
