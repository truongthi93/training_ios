//
//  SplashbaseImage.swift
//  iOSTraning2018
//
//  Created by Bao Ngo Mau on 9/17/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper

class SplashbaseImage : NSObject,Mappable{
    var id : String? = ""
    var large_url : String? = ""
    var url : String? = ""
    
    override init() {
    }
    
    required init?(map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        id <- map["id"]
        large_url <- map["large_url"]
        url <- map["url"]
    }
}
