//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPtcButton: UIButton!
    @IBOutlet weak var tenPtcButton: UIButton!
    @IBOutlet weak var twentyPtcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    var tipPercentage = 0.1
    var split = 2.0
    var bill = 0.0

    var tipPercentageToResults = 10.0
    var splitToResults = 2
    var billToResults = 0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPtcButton.isSelected = false
        tenPtcButton.isSelected = false
        twentyPtcButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle
        
        let deletePtc = buttonTitle!.dropLast()
        
        tipPercentageToResults = Double(deletePtc)!
        
        let buttonAsNumber = Double(deletePtc)!
        
        tipPercentage = buttonAsNumber / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.f", sender.value)
        let personAsNumber = splitNumberLabel.text!
        splitToResults = Int(personAsNumber)!
        let splitAsDecimal = Double(personAsNumber)!
        split = splitAsDecimal
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField.text!
        billToResults = Int(billText)!
        let billAsNumber = Double(billText)
        bill = billAsNumber ?? 0.0
        
        if tipPercentage == 0.0 {
            calculatorBrain.getPtc0(bill: bill, split: split)
        } else {
            calculatorBrain.getPtc(bill: bill, split: split, tipPercentage: tipPercentage)
        }
        
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.split = splitToResults
            destinationVC.tipPercentage = tipPercentageToResults
            destinationVC.bill = calculatorBrain.totalBill
        }
    }
}

