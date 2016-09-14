//
//  Config.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
/**https://www.googleapis.com/youtube/v3/search?key=AIzaSyB_gsGxnsSjO_6rlJOeZX2LDZ3hosNY6m8&q=%E9%95%B7&part=snippet&maxResults=30&order=viewCount***/


protocol httpConfigure {
    var baseUrl : String {get}
    var host : String {get}
    var path : String {get}
}

struct Environment : httpConfigure {
    static let sharedInstance = Environment()
    
    var baseUrl: String{
        return "https://" + host + path
    }
    
    var host: String {
        return "www.googleapis.com/"
    }
    
    var path: String {
        return "youtube/v3/"
    }
    
}
