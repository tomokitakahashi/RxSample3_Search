//
//  SearchRouter.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import RxSwift
import RxCocoa


/**https://www.googleapis.com/youtube/v3/search?key=AIzaSyB_gsGxnsSjO_6rlJOeZX2LDZ3hosNY6m8&q=%E9%95%B7&part=snippet&maxResults=30&order=viewCount***/

extension Api {
    struct SearchRouter : ApiRouter {
        var path: String {
            return "search"
        }
        var baseUrl: String {
            return Environment.sharedInstance.baseUrl
        }
        
        /***
         call api request & return Observable<[Items]>
         
         Items is dataModel from google Api youtube
         ***/
        
        func getSearch(searchStr : String) -> Observable<Items> {
            let parameters = [
                "key" : "AIzaSyB_gsGxnsSjO_6rlJOeZX2LDZ3hosNY6m8",
                "q" : "\(searchStr)" ,
                "part" : "snippet",
                "maxResults" : "30",
                "order" : "viewCount"
            ]
            
            return Api.createClient(.GET, router: Api.SearchRouter.init())
                    .settingParameters(parameters)
                    .request()
        }
        
    }
}
