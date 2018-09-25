//
//  RealmImageModel.swift
//  iOSTraning2018
//
//  Created by Bao Ngo Mau on 9/21/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import ObjectMapper
import RealmSwift
import Realm

class RealmImageModel : Object, Mappable{
    @objc dynamic var large_url : String? = Constants.stringNil
    @objc dynamic var url : String? = Constants.stringNil
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init()
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init()
    }
    
    required init() {
        super.init()
    }
    
    required init?(map: Map) {
        super.init()
    }
    
    // Mappable
    func mapping(map: Map) {
        large_url <- map[Constants.nameDataAPILarge_url]
        url <- map[Constants.nameDataAPIUrl]
    }

}
