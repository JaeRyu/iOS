//
//  ViewController.swift
//  Exchange
//
//  Created by kpugame on 2017. 4. 4..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label : UILabel!
    @IBOutlet var slider : UISlider!
    @IBOutlet var field : UITextField!
    @IBOutlet var box : UITextView!
    

    @IBAction func pressCal(sender : AnyObject)
    {
        box.text.removeAll()
        let money = Double((field.text! as NSString).doubleValue)
        let charge = Double(1000.0 + slider.value)
        let commision = charge * 0.02
        var total = charge + commision
        var result = money/total
        box.text.append("쿠폰 없음 : \(Int(result))달러 환전가능\n")
        
        
        total = charge + (commision * 0.7)
        result = money/total
        box.text.append("30% 쿠폰 : \(Int(result))달러 환전가능\n")
        
        total = charge + (commision * 0.5)
        result = money/total
        box.text.append("50% 쿠폰 : \(Int(result))달러 환전가능\n")

        total = charge + (commision * 0.3)
        result = money/total
        box.text.append("70% 쿠폰 : \(Int(result))달러 환전가능\n")

        
    }
    @IBAction func pressAny(sender : AnyObject)
    {
        field.resignFirstResponder()
    }
    @IBAction func changeVal(sender : AnyObject)
    {
        label.text = "환율 : \(1000+slider.value)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

