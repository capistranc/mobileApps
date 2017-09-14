//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Person {
    private (set) var car:Car?
    var name:String
    init(name: String){
        print("\(name) was born")
        self.name = name
    }
    
    func getACar(){
        self.car = Car(with:self)
    }
    
    deinit {
        print("This guy named \(self.name) just died")
    }
}

class Car {
//    weak var driver:Person? //To remove strong dependencies, weak makes sure the reference counter isn't incremented when Car is given a driver
    unowned var driver:Person //weak is optional, unowned cannot be optional
//    var driver3:Person // Car and driver does not get deallocated with a standard var because there's a strong dependency
    
    init(with driver:Person) {
        print("\(driver.name) got a car")
        self.driver = driver
//        self.driver2 = driver
    }
    
    deinit {
        print("and his car got crushed into a cube")
    }
}

func beGod() {
    let myPerson = Person(name: "doofus") // +1 person
    myPerson.getACar()
}
beGod()

//
//func createAndKillAPerson() {
//    var myPerson:Person? = Person(name: "doofus") // +1 person
//    var thisCar:Car? = Car(with: myPerson!) // + 1 car
//    myPerson?.car = thisCar //+1 car,
////    Car Crash
//    myPerson = nil //
////    print(thisCar.driver2) //This crashes, thisCar cannot exist without a driver
//}
//createAndKillAPerson()
