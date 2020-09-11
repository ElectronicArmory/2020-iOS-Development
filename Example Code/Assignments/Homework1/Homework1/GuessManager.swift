//
//  GuessManager.swift
//  Homework1
//
//  Created by Mike Z on 9/10/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import Foundation

class GuessManager: NSObject {
    var secretNumber:Int

    var secretNumbers:[Int] = Array()
    var guesses:[Int] = Array()

    override init() {
        secretNumber = 15
    }

    func checkGuess( guess:Int ) -> Bool{
        return false
    }
}
