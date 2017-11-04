//: Playground - noun: a place where people can play

import UIKit

protocol Service {}
class MyService:Service{ //This is the master
    init() {}
}

class Client {
    let service: Service
    
//    init() { regular
//        service = MyService()
//    }
    
    init(service:Service) { //Dependency Injection allows you to modify the service before you store it
        self.service = service //This is the slave
    }
}

