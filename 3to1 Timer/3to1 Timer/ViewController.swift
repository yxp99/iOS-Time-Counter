//
//  ViewController.swift
//  3to1 Timer
//
//  Created by cj on 9/21/18.
//  Copyright © 2018 3to1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var intList = [Int]()
    
    @IBOutlet weak var missButton: UIButton!
    @IBOutlet weak var makeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        missButton.isEnabled = false
        makeButton.isEnabled = false
    }
    
    //***********************Time Section*************************************
    
    @IBOutlet weak var countText: UITextField!
    @IBOutlet weak var lbl: UILabel!
    var time = 0
    var timer = Timer()
    
    
    @IBAction func start(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
    }
    
    @IBAction func countDown(_ sender: Any) {
        time = Int(countText.text!)!
        missButton.isEnabled = true
        makeButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countdonwAction), userInfo: nil, repeats: true)
    }
    
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func reset(_ sender: Any) {
        timer.invalidate()
        time = 0
        lbl.text = "0"
    }


    @objc func countdonwAction(){
        if(time == 0){
            timer.invalidate()
            sessionOver()
        }
        else{
            time -= 1
            lbl.text = String (time)
        }

    }
    @objc func action (){
        time += 1
        lbl.text = String(time)
    }
    
    func sessionOver(){
        for item in intList {
            print(item)
        }
        print("*******************")
        intList.removeAll()
        missButton.isEnabled = false
        makeButton.isEnabled = false
    }

//************************Timer Section Over*****************************//

    @IBAction func clickMake(_ sender: Any) {
        intList.append(1)
    }
    
    @IBAction func clickMiss(_ sender: Any) {
        intList.append(0)
    }
    
    
    
    
    

}
