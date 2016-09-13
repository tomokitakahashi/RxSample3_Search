//
//  Api.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa

enum ApiMethod : String{
    case GET = "GET"
    
    var alamofireMethod : Alamofire.Method? {
        switch self {
        case .GET:
            return Alamofire.Method.GET
        default:
            return nil
        }
    }
}

protocol ApiPath {
    var path : String {get}
}
protocol ApiRouter : ApiPath {
    var baseUrl : String {get}
}

class Api {
    
    private let method : ApiMethod
    private let router : ApiRouter
    private let encording : ParameterEncoding = .URL
    private var parameters : [String : AnyObject]?
    
    var requestUrl : NSURLRequest {
        let path = router.path
        let url = NSURL(string: router.baseUrl + path)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = method.rawValue
        request.addValue("", forHTTPHeaderField: "")
        return encording.encode(request, parameters: parameters).0
    }
    
    
    private init(method : ApiMethod, router : ApiRouter){
        self.method = method
        self.router = router
    }
    
    static func createClient(method : ApiMethod,router : ApiRouter) -> Api{
        return Api(method: method,router:router)
    }
    
    func settingParameters(parameters : [String : AnyObject]) -> Self {
        self.parameters = parameters
        return self
    }
    
    
    
    
    
    
    
}