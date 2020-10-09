//
//  ViewController.swift
//  DataStorage
//
//  Created by Mike Z on 10/8/20.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let managedObjectContainer = DatabaseController.managedObjectContainer()

        let chineseRestaurant = Restaurant(context: managedObjectContainer.viewContext)

        chineseRestaurant.restaurantName = "Chinese Name"


        let restaurantFetchRequest:NSFetchRequest = Restaurant.fetchRequest()
        let sortKey:String = "restaurantName"
        let sortDescriptor:NSSortDescriptor = NSSortDescriptor(key: sortKey, ascending: false)

        restaurantFetchRequest.sortDescriptors = [sortDescriptor]

//        let fetchPredicate:NSPredicate = NSPredicate(format: "restaurantName == %@", "Name") //
//        restaurantFetchRequest.predicate = fetchPredicate

        do{
            let fetchResults = try DatabaseController.managedObjectContainer().viewContext.fetch(restaurantFetchRequest)

            if( fetchResults.count > 0 ){

                print(fetchResults)

                for restaurant in fetchResults {
                    print( restaurant.restaurantName! )
                }
            }
            else{
                // TODO: Nothing, handle it
            }
        }
        catch{
            print(exception.self)
        }

        DatabaseController.saveContext()

    }


}

