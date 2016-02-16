//: Playground - noun: a place where people can play

import UIKit

class Person {
    var residence: Residence?
}

class Residence {
    
    var rooms = [Room]()
    
    var numberOfRooms: Int {
        
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        
        get {
            
            return rooms[i]
        }
        
        set {
            
            rooms[i] = newValue
        }
    }
    
    func printNumberOfRooms() {
        
        print("The room number is \(numberOfRooms)")
    }
    
    var address: Address?
}

class Room {
    
    let name: String
    
    init(name: String) {
        
        self.name = name
    }
}

class Address {
    
    var buildingName : String?
    
    var buildingNumber : String?
    
    var street: String?
    
    func buildingIdentifier() -> String? {
        
        if buildingName != nil {
            
            return buildingName
            
        } else if buildingNumber != nil && street != nil {
            
            return "\(buildingNumber) \(street)"
            
        } else {
            
            return nil
        }
    }
}

let john = Person()

func createAddress() -> Address {
    
    print("Function was called.")

    let someAddress = Address()

    someAddress.buildingNumber = "29"

    someAddress.street = "Acacia Road"
    
    return someAddress
}

john.residence?.address = createAddress()

//Prove that John residence no longer has a nil value
//john.residence = Residence()

if john.residence?.printNumberOfRooms() != nil {
    
    print("Succeed!")
    
} else {
    
    print("Failed.")
    
}

//john.residence?[0] = Room(name: "Bathroom")


let johnHouse = Residence()

johnHouse.rooms.append(Room(name: "Living Room"))

johnHouse.rooms.append(Room(name:"Kitchen"))


john.residence = johnHouse


if let firstRoomName = john.residence?[0].name {
    
    print("The first room name is \(firstRoomName).")
    
} else {
    
    print("Cannot retrieve the first room name.")
}

var testScore = ["Dave": [86,82,84], "Bev": [79, 94, 81]]


testScore["Dave"]?[0] = 91

testScore["Bev"]?[0]++

testScore["Brian"]?[0] = 72


print(testScore)

let johnAddress = Address()

johnAddress.buildingName = "The Larches"

johnAddress.street = "Laurel Street"

john.residence?.address = johnAddress


if let johnStreet = john.residence?.address?.street {
    
    print("John's street name is \(johnStreet).")
    
} else {
    
    print("Cannot retrieve the address.")
}

if let buidingIdentifier = john.residence?.address?.buildingIdentifier() {
    
    print("John's buiding identifier is \(buidingIdentifier).")
}

if let beginWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    
    if beginWithThe {
        
        print("Yup.")
        
    } else {
        
        print("Nope.")
    }
}



