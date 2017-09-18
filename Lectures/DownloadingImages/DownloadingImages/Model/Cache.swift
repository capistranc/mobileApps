//
//  Cache.swift
//  DownloadingImages
//
//  Created by Alfonso Tapia on 9/14/17.
//  Copyright © 2017 BB. All rights reserved.
//

import Foundation
import UIKit

class Cache{
    static var shared = Cache()
    var imageCache = NSCache<NSString,UIImage>()
}
