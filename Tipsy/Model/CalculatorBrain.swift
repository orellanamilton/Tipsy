//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Milton Orellana on 01/05/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var totalBill = "100"
    
    mutating func getPtc0(bill: Double, split: Double ) -> String {
        totalBill = String(bill / split)
        return totalBill
    }
    
    mutating func getPtc(bill: Double, split: Double, tipPercentage: Double) -> String {
       totalBill = String(format: "%.2f", (bill + (bill * tipPercentage)) / split)
        return totalBill
    }
 }
