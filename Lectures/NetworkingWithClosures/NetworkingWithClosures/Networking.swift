//
//  Networking.swift
//  NetworkingWithClosures
//
//  Created by Mac on 9/13/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class Networking {
    //escaping allows the function to complete without waiting for completeion, ie turns closure into a callback function
    static func callApi(url:String, completion:@escaping ([SWCharacter]?, Error?) -> ()) {
        guard let url = URL(string:url) else {return}
        
        let session = URLSession.shared

        let task = session.dataTask(with: url) { (data, res, error) in
            guard let res = res as? HTTPURLResponse else {return}
            guard res.statusCode == 200 else {
                return
            }
            guard error == nil else {return}
            guard let data = data else {return}
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                guard let dictionary = json as? [String:Any] else {return}
                guard let character = SWCharacter(dict: dictionary) else {return}
                completion([character], error)
            } catch {
                print("something went wrong")
            }
        }
        task.resume()
    }
}

class SWCharacter {
    var name:String
    var worldUrl:String
    
    init?(dict:[String:Any]) {
        guard let name = dict["name"] as? String else {return nil}
        guard let worldUrl = dict["homeworld"] as? String else {return nil}
        self.name = name
        self.worldUrl = worldUrl
    }
}
