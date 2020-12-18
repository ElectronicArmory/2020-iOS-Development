//
//  GeoCacheListViewController.swift
//  ScavengerHunt
//
//  Created by Mike Z on 11/10/20.
//

import UIKit
import CoreData


class GeoCacheListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    // MARK: - Table View Code
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GeoCacheController.geocacheList().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = nil
        if( indexPath.row % 2 == 0){
            let geoCell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GeoCacheCell") as! CustomTableViewCell

            geoCell.enabledSwitch.tag = indexPath.row

            if( indexPath.row < 4){
                geoCell.activityIndicator.startAnimating()
            }
            else{
                geoCell.activityIndicator.stopAnimating()
            }
            return geoCell
        }
        else{
            cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")
            let currentGeoCache = GeoCacheController.geocacheList()[indexPath.row]
            cell?.textLabel?.text = currentGeoCache.geocacheName
            cell?.detailTextLabel?.text = "Seomthingslslsdkd"

            return cell!
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row: \(indexPath.row)")
        let geocacheToDelete = GeoCacheController.geocacheArray[indexPath.row]

        DatabaseController.getContext().delete(geocacheToDelete)
        DatabaseController.saveContext()
    }

    // MARK: -

    override func viewDidLoad() {
        super.viewDidLoad()

        LocationController.startGPS()


        NotificationCenter.default.addObserver(self, selector: #selector(geoCacheWasUpdated(notification:)), name: NSNotification.Name("NEW_GEOCACHE"), object: nil)

        GeoCacheController.fetchData()
    }

    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    @objc
    func geoCacheWasUpdated(notification:Notification) {
        tableView.reloadData()
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
