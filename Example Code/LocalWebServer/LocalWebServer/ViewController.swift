//
//  ViewController.swift
//  LocalWebServer
//
//  Created by Mike Z on 10/22/20.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        AF.request("http://localhost:3000/").responseJSON { response in
            print(response)
        }
    }


}

