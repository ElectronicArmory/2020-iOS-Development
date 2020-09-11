//
//  CalculatorViewController.swift
//  Homework1
//
//  Created by Mike Z on 9/10/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var outputDisplay: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func calcButtonTapped(_ sender: UIButton) {
        var displayValue:String = outputDisplay.text!
        let pressedValue:Int = sender.tag

        let newCalculation = pressedValue // do your calculation
        displayValue.append(String(newCalculation))

        outputDisplay.text = displayValue
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
