//
//  MapViewController.swift
//  ScavengerHunt
//
//  Created by Mike Z on 11/12/20.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()



    }

    fileprivate func addGeoCachePin(_ allAnnotations: [MKAnnotation], _ geoCaches: [GeoCache]) {
        self.mapView.removeAnnotations(allAnnotations)
        for geoCache in geoCaches {
            let coordinate = CLLocationCoordinate2DMake(geoCache.location!.latitude as Double, geoCache.location!.longitude as Double)

            let mapPin = GeoCacheMapPin(title: geoCache.geocacheName!, subtitle: geoCache.geocacheDescription!, coordinate: coordinate)
            mapView.addAnnotation(mapPin)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        let geoCaches = GeoCacheController.geocacheList()

        let allAnnotations = self.mapView.annotations
        addGeoCachePin(allAnnotations, geoCaches)
    }

    override func viewDidAppear(_ animated: Bool) {
        print("something")
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
