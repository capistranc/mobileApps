//
//  Networking.swift
//  NetworkingUnitTests
//
//  Created by Mac on 9/20/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class Networking{
    
    static func callApi(url:String, completion:@escaping(Data?, Error?) ->()){
        
        guard let url = URL(string:url) else {
            completion(nil,nil)
            return print("didn mak past url")
        }
        
        URLSession.shared.dataTask(with: url){data, response, error in
            print("!!!!!!!12startedNetwork")
            
            completion(data, error)
        }
    }
    
}
