//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 01/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userAmount: UILabel!
    var displayuserAmount = ""
    var userAmountDouble = 0.0
    
    @IBAction func num9(_ sender: UIButton) {enterAmount(num: 9)}
    @IBAction func num8(_ sender: UIButton) {enterAmount(num: 8)}
    @IBAction func num7(_ sender: UIButton) {enterAmount(num: 7)}
    @IBAction func num6(_ sender: UIButton) {enterAmount(num: 6)}
    @IBAction func num5(_ sender: UIButton) {enterAmount(num: 5)}
    @IBAction func num4(_ sender: UIButton) {enterAmount(num: 4)}
    @IBAction func num3(_ sender: UIButton) {enterAmount(num: 3)}
    @IBAction func num2(_ sender: UIButton) {enterAmount(num: 2)}
    @IBAction func num1(_ sender: UIButton) {enterAmount(num: 1)}
    @IBAction func num0(_ sender: UIButton) {enterAmount(num: 0)}
    @IBAction func numDot(_ sender: UIButton) {decimalNum()}
    @IBAction func numClear(_ sender: UIButton) {clearAmount()}
    
    @IBOutlet weak var numDotOutlet: UIButton!
    
    //////////////////////////////////////////////tip part/////////////////////////////////////////////////////
    @IBOutlet weak var tip1: UILabel!
    @IBOutlet weak var tip2: UILabel!
    @IBOutlet weak var tip3: UILabel!
    var tip1Percent = 1
    var tip2Percent = 5
    var tip3Percent = 10
    
    @IBOutlet weak var tip1AmountLabel: UILabel!
    @IBOutlet weak var tip2AmountLabel: UILabel!
    @IBOutlet weak var tip3AmountLabel: UILabel!
    var tip1Amount = 0.0
    var tip2Amount = 0.0
    var tip3Amount = 0.0
    
    @IBOutlet weak var tipAndAmount1Label: UILabel!
    @IBOutlet weak var tipAndAmount2Label: UILabel!
    @IBOutlet weak var tipAndAmount3Label: UILabel!
    var tipAndAmount1 = 0.0
    var tipAndAmount2 = 0.0
    var tipAndAmount3 = 0.0
    
    @IBAction func tipSlider(_ sender: UISlider) {
        tip1Percent = Int(sender.value)
        tip2Percent = Int(sender.value) + 5
        tip3Percent = Int(sender.value) + 10
        
        calculateTips()
    }
    
    /////////////////////////////////////calculate for group///////////////////////////////////////////////
    var groupMembers = 1
    @IBOutlet weak var groupMembersLabel: UILabel!
    @IBAction func GroupSizeSlider(_ sender: UISlider) {
        groupMembers = Int(sender.value)
        
        calculateTips()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAmount.text! = "0"
        calculateTips()
        
    }

    func enterAmount(num: Int){
        displayuserAmount += "\(num)"
        userAmount.text! = "\(displayuserAmount)"
        userAmountDouble = Double(displayuserAmount)!
        print(userAmountDouble)
        
        calculateTips()
    }
    func decimalNum(){
        if displayuserAmount == "" {
            displayuserAmount = "0."
            userAmount.text! = "\(displayuserAmount)"
            userAmountDouble = Double(displayuserAmount)!
        }
        else{
          displayuserAmount += "."
          userAmount.text! = "\(displayuserAmount)"
          userAmountDouble = Double(displayuserAmount)!
        }
        print(userAmountDouble)
        numDotOutlet.isEnabled = false
    }
    func clearAmount(){
        displayuserAmount = ""
        userAmount.text! = "0"
        userAmountDouble = 0.0
        numDotOutlet.isEnabled = true
        
        calculateTips()
    }
    
    func calculateTips(){
        tip1.text = "\(tip1Percent)%"
        tip2.text = "\(tip2Percent)%"
        tip3.text = "\(tip3Percent)%"
        
        groupMembersLabel.text = "Group Size: \(groupMembers)"
        let groupMembersDouble = Double(groupMembers)
        
        tip1Amount = round(userAmountDouble * Double(tip1Percent) / 100 * 100) / 100.0
        tip2Amount = round(userAmountDouble * Double(tip2Percent) / 100 * 100) / 100.0
        tip3Amount = round(userAmountDouble * Double(tip3Percent) / 100 * 100) / 100.0
        tip1AmountLabel.text = "\(tip1Amount/groupMembersDouble)"
        tip2AmountLabel.text = "\(tip2Amount/groupMembersDouble)"
        tip3AmountLabel.text = "\(tip3Amount/groupMembersDouble)"

        tipAndAmount1 = round((userAmountDouble + tip1Amount)/groupMembersDouble * 100) / 100.0
        tipAndAmount2 = round((userAmountDouble + tip2Amount)/groupMembersDouble * 100) / 100.0
        tipAndAmount3 = round((userAmountDouble + tip3Amount)/groupMembersDouble * 100) / 100.0
        tipAndAmount1Label.text = "\(tipAndAmount1)"
        tipAndAmount2Label.text = "\(tipAndAmount2)"
        tipAndAmount3Label.text = "\(tipAndAmount3)"
    }

}
