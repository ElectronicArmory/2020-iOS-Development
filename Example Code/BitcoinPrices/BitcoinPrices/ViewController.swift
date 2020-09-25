//
//  ViewController.swift
//  BitcoinPrices
//
//  Created by Mike Z on 9/22/20.
//

import UIKit
import Alamofire


class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(loadedBitcoinData(notification:)), name: NSNotification.Name("BITCOIN_LOAD_SUCCESS"), object: nil)
        WebServices.requestBitcoinprice()
    }

    @objc
    func loadedBitcoinData(notification:Notification){
        print(notification.object as! String)
        self.priceLabel.text = notification.object as! String
    }

}

