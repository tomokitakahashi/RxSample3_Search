//
//  ItemModel.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import ObjectMapper

class Item : Base {
    private(set) var id : [Id]?
    private(set) var snippet : [Snippet]?
    
    override func mapping(map: Map) {
        id <- map["id"]
        snippet <- map["snippet"]
    }
}


