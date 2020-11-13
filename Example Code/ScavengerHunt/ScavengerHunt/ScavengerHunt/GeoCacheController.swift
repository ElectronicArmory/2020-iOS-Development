//
//  GeoCacheController.swift
//  ScavengerHunt
//
//  Created by Mike Z on 11/10/20.
//

import UIKit
import CoreData


class GeoCacheController: NSObject {


    static var geocacheArray = Array<GeoCache>()


    class func fetchData(){
        let managedObjectContext = DatabaseController.getContext()

        let fetchRequest:NSFetchRequest = GeoCache.fetchRequest()

        do {
            let fetchResults = try managedObjectContext.fetch(fetchRequest)

            if(fetchResults.count > 0){
                GeoCacheController.geocacheArray.append(contentsOf: fetchResults)
                NotificationCenter.default.post(Notification(name: Notification.Name("NEW_GEOCACHE")))
            }
        }
        catch{
            print(exception.self)
        }


    }

    class func addGeoCache(newGeoCache:GeoCache){
        GeoCacheController.geocacheArray.append(newGeoCache)
    }

    class func createGeoCache(newName:String, newDescription:String, newCategory:String, newLatitude:Double, newLongitude:Double, shouldSaveToDB:Bool ){
        var geocache:GeoCache = GeoCache(context: DatabaseController.getContext())


        geocache.geocacheName = newName
        geocache.geocacheDescription = newDescription
        geocache.geocacheCategory = newCategory

        geocache.location = Location(context: DatabaseController.getContext())
        geocache.location?.latitude = newLatitude
        geocache.location?.longitude = newLongitude

        GeoCacheController.addGeoCache(newGeoCache: geocache)

        DatabaseController.saveContext()

        NotificationCenter.default.post(Notification(name: Notification.Name("NEW_GEOCACHE")))
    }

    class func geocacheList() -> Array<GeoCache>{
        return GeoCacheController.geocacheArray
    }
}
