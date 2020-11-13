//
//  WebServices.swift
//  ScavengerHunt
//
//  Created by Mike Z on 11/12/20.
//

import UIKit
import Alamofire

class WebServices: NSObject {

    static let NAME_KEY = "name"
    static let DESCRIPTION_KEY = "description"
    static let LOCATION_KEY = "location"


    class func loadGeoCaches(){

        let requestString = "http://localhost:3000/"
        let url = URL(string: requestString)
        let urlRequest = URLRequest(url: url!)



        AF.request(urlRequest).responseJSON {
            (jsonResponse) in
            switch(jsonResponse.result){
                case let .success(success):
                    print(success)
                    if( jsonResponse.response!.statusCode / 100 == 2){
                        let geoCacheArray = success as! Array<Dictionary<AnyHashable, Any>>


                        for(_, jsonObject) in geoCacheArray.enumerated(){
                            let geoCache:Dictionary = jsonObject as! Dictionary<String, AnyObject>
                            print(geoCache)
                            let nameString:String = geoCache[NAME_KEY] as! String
                            let descriptionString:String = geoCache[DESCRIPTION_KEY] as! String
                            let locationObject = geoCache[LOCATION_KEY] as! Dictionary<AnyHashable, Any>

                            GeoCacheController.createGeoCache(newName: nameString, newDescription: descriptionString, newCategory: "", newLatitude: locationObject["latitude"] as! Double, newLongitude: locationObject["longitude"] as! Double, shouldSaveToDB: false)
                        }
                    }

                case let .failure(error):
                    NotificationCenter.default.post(name: Notification.Name("LOAD_FAILURE"), object: error)
            }
        }
    }
}
