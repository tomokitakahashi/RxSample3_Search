//
//  ListViewModel.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class ListViewModel: NSObject {
    

    private(set) var items : Driver<[Items]> = Driver.never()
    
    func SearchData(searchStr : String){
        Api.SearchRouter.getSearch(searchStr)
    }
    
}

