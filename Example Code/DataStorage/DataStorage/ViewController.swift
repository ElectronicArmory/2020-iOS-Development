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

        let restaurant = Restaurant(context: managedObjectContainer.viewContext)

        restaurant.restaurantName = "Italian Cuisine"

        let thaiCategory = Category(context: managedObjectContainer.viewContext)
        thaiCategory.categoryName = "Thai"
        thaiCategory.restaurants?.adding(restaurant)
        restaurant.foodCategory = thaiCategory


        let restaurantFetchRequest:NSFetchRequest = Restaurant.fetchRequest()

        let categoryFetchRequest:NSFetchRequest = Category.fetchRequest()
        let fetchCategoryPredicate:NSPredicate = NSPredicate(format: "categoryName CONTAINS %@", "Thai") //
        categoryFetchRequest.predicate = fetchCategoryPredicate

        let sortKey:String = "restaurantName"
        let sortDescriptor:NSSortDescriptor = NSSortDescriptor(key: sortKey, ascending: false)

        restaurantFetchRequest.sortDescriptors = [sortDescriptor]

        let fetchPredicate:NSPredicate = NSPredicate(format: "restaurantName CONTAINS %@", "Greek") //
        restaurantFetchRequest.predicate = fetchPredicate

        do{
            let fetchResults = try managedObjectContainer.viewContext.fetch(restaurantFetchRequest)

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

        do{
            let fetchResults = try managedObjectContainer.viewContext.fetch(categoryFetchRequest)

            if( fetchResults.count > 0 ){

                print(fetchResults)

                for currentCategory in fetchResults {
                    print( currentCategory.categoryName! )
                    print( currentCategory.restaurants! )
                    let restuarant = currentCategory.restaurants!.anyObject() as! Restaurant
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

