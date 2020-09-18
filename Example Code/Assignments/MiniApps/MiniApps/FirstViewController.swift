//
//  FirstViewController.swift
//  MiniApps
//
//  Created by Mike Z on 9/3/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView


class FirstViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBOutlet weak var outputLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        let activityIndicatorView = NVActivityIndicatorView(frame: self.view.frame, type: .lineScalePulseOut, color: UIColor.red, padding: 50.0)
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }


    @IBAction func concatTapped(_ sender: Any) {

        let concatenatedString = "Hello \(firstNameTextField.text!) \(lastNameTextField.text!), nice to meet you!"
        

        outputLabel.text = concatenatedString
//        outputLabel.constraints = [NSLayoutConstraint]
    }

    
}

