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
    private(set) var ids : Id?
    private(set) var snippet : Snippet?
    private(set) var etag : String?
    
    override func mapping(map: Map) {
        ids <- map["id"]
        snippet <- map["snippet"]
        etag <- map["etag"]
    }
}


