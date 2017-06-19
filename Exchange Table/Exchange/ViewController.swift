//
//  ViewController.swift
//  Exchange
//
//  Created by kpugame on 2017. 4. 4..
//  Copyright © 2017년 Jae Won Yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet var labelDollar : UILabel!
    @IBOutlet var labelYen : UILabel!
    @IBOutlet var labelFranc : UILabel!
    @IBOutlet var sliderDollar : UISlider!
    @IBOutlet var sliderYen : UISlider!
    @IBOutlet var sliderFranc : UISlider!
    @IBOutlet var field : UITextField!
    @IBOutlet weak var table : UITableView!
    //@IBOutlet var box : UITextView!
    var tableData : Array<String> = Array<String>()

    @IBAction func pressCal(sender : AnyObject)
    {
//        box.text.removeAll()
//        let money = Double((field.text! as NSString).doubleValue)
//        let charge = Double(1000.0 + sliderDollar.value)
//        let commision = charge * 0.02
//        var total = charge + commision
//        var result = money/total
//        box.text.append("쿠폰 없음 : \(Int(result))달러 환전가능\n")
//        total = charge + (commision * 0.7)
//        result = money/total
//        box.text.append("30% 쿠폰 : \(Int(result))달러 환전가능\n")
//        
//        total = charge + (commision * 0.5)
//        result = money/total
//        box.text.append("50% 쿠폰 : \(Int(result))달러 환전가능\n")
//
//        total = charge + (commision * 0.3)
//        result = money/total
//        box.text.append("70% 쿠폰 : \(Int(result))달러 환전가능\n")

        //￥
        tableData.removeAll()
        let money = Double((field.text! as NSString).doubleValue)
        let chargeDolloar = Double(1000.0 + sliderDollar.value)
        let chargeYen = Double(1000.0 + sliderYen.value)
        let chargeFranc = Double(1000.0 + sliderFranc.value)
       
        
        tableData.append("교환가능 달러 : \(money/(chargeDolloar + (chargeDolloar*0.02)))")
        tableData.append("교환가능 엔화 : \(money/(chargeYen + (chargeYen*0.02)))")
        tableData.append("교환가능 프랑 : \(money/(chargeFranc + (chargeFranc*0.02)))")
        table.reloadData()
        
    }
    @IBAction func pressAny(sender : AnyObject)
    {
        field.resignFirstResponder()
    }
    @IBAction func changeValDollar(sender : AnyObject)
    {
        labelDollar.text = "달러($) : \(1000+sliderDollar.value)"
    }
    @IBAction func changeValYen(sender : AnyObject)
    {
        labelYen.text = "엔화(￥) : \(1000+sliderYen.value)"
    }
    @IBAction func changeValFranc(sender : AnyObject)
    {
        labelFranc.text = "프랑(F) : \(1000+sliderFranc.value)"
    }
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style:UITableViewCellStyle.value2, reuseIdentifier:nil)
        cell.detailTextLabel?.text = tableData[indexPath.row]
        return cell
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

