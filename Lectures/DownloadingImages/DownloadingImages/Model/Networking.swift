//
//  Networking.swift
//  DownloadingImages
//
//  Created by Alfonso Tapia on 9/14/17.
//  Copyright © 2017 BB. All rights reserved.
//

import Foundation
import UIKit

enum NetworkingErrors:Error{
    case UrlSucks
    case NoDataOnUrl
    case DataHasNoImage
}

enum NetworkCallType{
    case image
    case character
    case starship
    
    func getUrl()->String{
        switch self {
        case .image:
            return Constants.kImageUrl
        default:
            return "stupid! you messed up!"
        }
    }
}

class Networking{
    
    static func callNetwork(type:NetworkCallType,objectName:String,closure:@escaping(Any?,Error?)->()){
        switch type {
        case .image:
            downloadImage(url: type.getUrl() + objectName + ".png", closure: closure)
        default:
            return
        }
    }
    
    private static func downloadImage(url:String,closure:@escaping (UIImage?,Error?)->()){
        
        guard let url = URL(string:url) else {
            closure(nil, NetworkingErrors.UrlSucks)
            return
        }
        let session = URLSession.shared
        let task = session.dataTask(with: url) {
            (data, response, error) in
            guard error == nil else {
                closure(nil, error)
                return
            }
            guard let data = data else {
                closure(nil, NetworkingErrors.NoDataOnUrl)
                return
            }
            guard let image = UIImage(data:data) else {
                closure(nil, NetworkingErrors.DataHasNoImage)
                return
            }
            closure(image, nil)
        }
        task.resume()
    }
    
    
    
}
