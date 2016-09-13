//
//  IdModel.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper

class Id : Base {
    private(set) var kind : String?
    private(set) var videoId : String?
    
    override func mapping(map: Map) {
        kind <- map["kind"]
        videoId <- map["videoId"]
    }
}
