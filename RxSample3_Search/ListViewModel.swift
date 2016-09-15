//
//  ListViewModel.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//


import RxSwift
import RxCocoa


class ListViewModel: NSObject {
    
    static var sharedInstance = ListViewModel()
    
    private let searchRouter = Api.SearchRouter()
    
    private(set) var items : Driver<[Item]> = Driver.never()
    
    func SearchDataItem(searchStr : String) -> Observable<[Item]>{
    
        return searchRouter.getSearch(searchStr)
                .observeOn(SerialDispatchQueueScheduler(globalConcurrentQueueQOS: .Background))
                .retry(3)
                .map({ object in
                    guard let item = object.items else {
                        return []
                    }
                    return item
                })
        
    }
    
    
}

