//
//  Networking.swift
//  networkingExample
//
//  Created by Mac on 9/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation



protocol NetworkingDelegate:class{
    func apiDidReturnWithObject(names: [String])
    func apiDidFailWithError(error: String)
    func apiResponseFailure(statusCode: Int)
}

class Networking {
    weak var delegate:NetworkingDelegate?
    
    func callSWapi(pageNumber:Int) {
        let basePage = "https://swapi.co/api/"
        let pageAdd = "people/?page=\(pageNumber)"
        //        let keyAdd = "&"
        guard let url = URL(string: basePage + pageAdd) else {
            delegate?.apiDidFailWithError(error: "url is bonkers")
            return
        }
        
        //        let request = URLRequest(url: url) //This to add an apikey to each
        //        request.addValue("thisismykey", forHTTPHeaderField: "Authroization")
        //        let session = URLSession.shared
        //        let task =  session.dataTask(with: <#T##URLRequest#>)
        
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, res, error) in
            guard error == nil else {
                self.delegate?.apiDidFailWithError(error: error!.localizedDescription)
                return
            }
            
            guard let res = res as? HTTPURLResponse else {return}
            guard res.statusCode == 200 else {
                self.delegate?.apiResponseFailure(statusCode: res.statusCode)
                return
            }
            
            guard let data = data else {return}
            //            guard let image = UIImage(data:data) else {return}
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data)
                guard let dictionary = jsonObject as? [String:Any] else {return}
                guard let results = dictionary["results"] as? [ [String:Any] ] else {return}
                let names = results.flatMap{ $0["name"] as? String}
                self.delegate?.apiDidReturnWithObject(names: names)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    

}
