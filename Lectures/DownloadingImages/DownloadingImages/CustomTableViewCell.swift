//
//  CustomTableViewCell.swift
//  DownloadingImages
//
//  Created by Alfonso Tapia on 9/14/17.
//  Copyright © 2017 BB. All rights reserved.
//

import Foundation
import UIKit

class CustomTableViewCell:UITableViewCell{
    
    @IBOutlet weak var myImageView:UIImageView!
    @IBOutlet weak var label:UILabel!
    
    func fillCell(name:String){
        self.label.text = name
        if let image = Cache.shared.imageCache.object(forKey: name as NSString){
            self.myImageView.image = image
        } else {
            myImageView.image = #imageLiteral(resourceName: "placeholder-image")
            Networking.callNetwork(type: .image,objectName: name) {
                [weak self](image, error) in
                guard error == nil else {return}
                guard let image = image as? UIImage else {return}
                Cache.shared.imageCache.setObject(image, forKey: name as NSString)
                DispatchQueue.main.async {
                    self?.myImageView.image = image
                }
            }
        }
        
    }
    
}
