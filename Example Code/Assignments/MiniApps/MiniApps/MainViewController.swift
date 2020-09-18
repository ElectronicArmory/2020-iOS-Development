//
//  MainViewController.swift
//  MiniApps
//
//  Created by Mike Z on 9/15/20.
//  Copyright © 2020 Electronic Armory. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func viewDidAppear(_ animated: Bool) {
        
        let isLoggedIn = true
        if( isLoggedIn ){
            // Show Tab Bar Controller
            let tabBarController = storyboard?.instantiateViewController(identifier: "TabBarController")
            present(tabBarController!, animated: false) {
                print("DONE!")
            }
        }
        else{
            // Show log in screen
        }
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
