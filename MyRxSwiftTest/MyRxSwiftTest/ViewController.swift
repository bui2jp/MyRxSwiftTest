//
//  ViewController.swift
//  MyRxSwiftTest
//
//  Created by 奥山拓弥 on 2020/02/16.
//  Copyright © 2020 奥山拓弥. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myButton2: UIButton!

    private let myApp = UIApplication.shared.delegate as! AppDelegate
    
    private var myData: BehaviorRelay<MyMode>? = BehaviorRelay(value: (UIApplication.shared.delegate as! AppDelegate).myData)
    
    private let myCount: BehaviorRelay<Int> = BehaviorRelay(value: 0)
    private let disposeBag: DisposeBag = DisposeBag()
    
//    private var myData: BehaviorRelay<MyMode>? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        let ap = UIApplication.shared.delegate as! AppDelegate
//        myData = BehaviorRelay(value: ap.myData)
        
        bindButtonToValue()
        bindCountToText()
        
        bindButtonToValue2()
        bindCountToText2()
        
    }

    private func bindButtonToValue() {
        myButton.rx.tap
            .subscribe(onNext: { [weak self] _ in
                print("myButton subscribe...")
                self?.increment()})
            .disposed(by: disposeBag)
    }
    
    private func bindButtonToValue2() {
        myButton2.rx.tap
            .subscribe(onNext: { [weak self] _ in
                print("myButton2 subscribe...")
                self?.increment2()})
            .disposed(by: disposeBag)
    }
    
    private func increment() {
        print("increment start...")
        myCount.accept(myCount.value + 1)
    }
    
    private func increment2() {
        print("increment2 start...")
        let d = myData?.value
        d?.remark = "y1"
        myData?.accept(d!)
        
    }
    
    private func bindCountToText() {
        //        myCount.asObservable()
        //            .subscribe(onNext: { [weak self] count in
        //                print("myCount subscribe start...")
        //                self?.myLabel.text = String(count) })
        //            .disposed(by: disposeBag)
        
        myCount.asObservable()
        .map{
            print("map start : \($0)")
            return String($0)
        }
        .bind(to: myLabel.rx.text)
        .disposed(by: disposeBag)
    }
    
    private func bindCountToText2() {
        myData?.asObservable()
            .subscribe(onNext: { [weak self] d in
                print("myData subscribe start...")
                self?.myLabel.text = d.remark })
            .disposed(by: disposeBag)
        }
    
    @IBAction func modifyMyModel(_ sender: Any) {
        let app = UIApplication.shared.delegate as! AppDelegate
        app.myData.name = "x1"
        let myData2 = MyMode()
        myData2.remark = "x2"
        app.myData = myData2
        
        myData?.accept(myData2)

    }
    
    
}

