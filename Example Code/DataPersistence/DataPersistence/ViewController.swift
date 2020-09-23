//
//  ViewController.swift
//  DataPersistence
//
//  Created by Mike Z on 9/22/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Loading a PList from disk
        let preferencesFilePath =  Bundle.main.path(forResource: "Preferences", ofType: "plist")
        guard FileManager.default.contents(atPath: preferencesFilePath!) != nil else {
            print("file doesn't exist!")
            return
        }

        let plistURL = URL(fileURLWithPath: preferencesFilePath!)
        let data = try! Data(contentsOf: plistURL)
        let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as! Dictionary<String, AnyObject>

        let copyright = plist["Copyright"]
        let serversArray = plist["Servers"]

        print(copyright!)
        print(serversArray!)


        var numberOfLaunches:Int = UserDefaults.standard.integer(forKey: "LAUNCHES")

        numberOfLaunches += 1

        UserDefaults.standard.setValue(numberOfLaunches, forKey: "LAUNCHES")

        if( numberOfLaunches > 3 ){
            print("Ask user for a rating on the app store.")
        }
    }


}

