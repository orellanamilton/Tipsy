//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Milton Orellana on 01/05/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var split = 2
    var tipPercentage = 10.0
    var bill = "0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = bill
        settingsLabel.text = "Split between \(split) people, with \(tipPercentage)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
