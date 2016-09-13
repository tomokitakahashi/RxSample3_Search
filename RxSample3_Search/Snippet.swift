//
//  SnippetModel.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import ObjectMapper

class Snippet: Base {
    private(set) var pubishedAt : NSDate?
    private(set) var channelId : String?
    private(set) var title : String?
    private(set) var description : String?
    private(set) var thumbnail : NSURL?
    private(set) var channelTitle : String?
    private(set) var liveBroadcastContent : String?
    
    override func mapping(map: Map) {
        pubishedAt <- (map["publishredAt"],DateTransform())
        channelId <- map["channelId"]
        title <- map["title"]
        description <- map["description"]
        thumbnail <- (map["thumnails"]["default"]["url"],URLTransform())
        channelTitle <- map["channelTitle"]
        liveBroadcastContent <- map["liveBroadcastContent"]
    }
    
}
