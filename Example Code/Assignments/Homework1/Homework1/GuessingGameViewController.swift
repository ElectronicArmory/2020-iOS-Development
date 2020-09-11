//
//  GuessingGameViewController.swift
//  Homework1
//
//  Created by Mike Z on 9/10/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import UIKit

class GuessingGameViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var guessingTextField: UITextField!


    @IBOutlet weak var giveUpButton: UIButton!
    @IBOutlet weak var guessButton: UIButton!

    @IBOutlet weak var guessLabel: UILabel!

    @IBOutlet weak var winLabel: UILabel!

    var numberOfGuesses:Int = 0
    let guessManager:GuessManager = GuessManager()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func guessNumberTapped(_ sender: Any) {
        let numberString = guessingTextField.text!
        let numberInt = Int(numberString)

        if( numberInt == guessManager.secretNumber){ // winning condition
            guessingTextField.resignFirstResponder()
            winLabel.isHidden = false

            guessingTextField.isEnabled = false
        }
        else{
            numberOfGuesses += 1
            guessLabel.text = "You've guessed \(numberOfGuesses) times."
            guessButton.isEnabled = false
        }

    }
    
}
