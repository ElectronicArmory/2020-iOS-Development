//
//  ViewController.swift
//  FirstApp
//
//  Created by Mike Z on 8/27/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var progressView: UIProgressView!

    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let helloWorldString = "Hello, playground"
//
//        let amount = "4.5"
//
//        let dollarAmout:Int = 4
//
//        let interest:Float = 0.02
//
//        let newValue = Float(dollarAmout) * interest
//
//        let array = ["hello", "world"]
//
//        for arrayItem in array {
//            print(arrayItem)
//        }

//        titleLabel.text = "Hello!!"

        progressView.progress = 0.6642

        slider.value = 0.1
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

//        titleLabel.text = "****************************"
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
//        titleLabel.text = "Button was tapped."
        sender.titleLabel?.text = "Sender was tapped"
        progressView.progress = progressView.progress + 0.05
    }
    
    @IBAction func sliderSlid(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func switchWasSwitched(_ sender: UISwitch) {
        print(sender.isOn)
    }
}

