//
//  ViewController.swift
//  MyRealmTest
//
//  Created by 奥山拓弥 on 2020/02/09.
//  Copyright © 2020 奥山拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        // Use them like regular Swift objects
        let myDog = Dog()
        myDog.name = "Rexxxxx"
        myDog.age = 1
        print("name of dog: \(myDog.name)")

        // Get the default Realm
        let realm = try! Realm()

        // Query Realm for all dogs less than 2 years old
        let puppies = realm.objects(Dog.self).filter("age < 2")
        //puppies.count // => 0 because no dogs have been added to the Realm yet

        // Persist your data easily
        try! realm.write {
            realm.add(myDog)
        }
        
    }
    @IBAction func tapButton(_ sender: Any) {
        print("tap button")
                
        let myDog = Dog()
        myDog.name = "aaaa"
        myDog.name2 = "bbbb"
        myDog.age = 111
        myDog.age2.value = 222
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(myDog)
        }
        
    }
    
    @IBAction func addItem2(_ sender: Any) {
        MyRealm.addDogItem()
    }
    
    
}

