//
//  Items.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper


final class Items: Base {
    private(set) var items : [Item]?
    
    override func mapping(map: Map) {
        items <- map["items"]
    }
}

