import UIKit

var nonNillableString:String
nonNillableString = "Some value"

if( nonNillableString != nil ){
    print("string is not nil")
}


var optionalString:String?

optionalString = "Not nil anymore"

// ... GET server data

if let countValue = optionalString?.count {
    print(countValue)
}
else{
    print("It was nil")
}


//}

