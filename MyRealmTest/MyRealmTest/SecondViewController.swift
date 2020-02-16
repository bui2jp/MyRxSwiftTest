//
//  SecondViewController.swift
//  MyRealmTest
//
//  Created by 奥山拓弥 on 2020/02/09.
//  Copyright © 2020 奥山拓弥. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Second View ...")
        let realm = try! Realm()
        
        let puppies = realm.objects(Dog.self)
        
        print("puppies.count ---> \(puppies.count)")
        print(puppies)
    }
    
    @IBAction func readItem(_ sender: Any) {
        MyRealm.readDogItem()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
