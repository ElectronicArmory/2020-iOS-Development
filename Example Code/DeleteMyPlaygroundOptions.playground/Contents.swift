import UIKit

var str = "Hello, playground"

var notNullable:String?

//notNullable = "Not nullable"

if let characterCount = notNullable?.count {
    print(characterCount)
}

if( notNullable != nil ){
    print(notNullable?.count)
}
