//
//  ViewController.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//


import UIKit
import TwitterKit

/**https://www.googleapis.com/youtube/v3/search?key=AIzaSyB_gsGxnsSjO_6rlJOeZX2LDZ3hosNY6m8&q=%E9%95%B7&part=snippet&maxResults=30&order=viewCount***/
class RoginViewController: UIViewController {

    private var searchBar : UISearchBar!
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSearchBar()
        
        
       viewModel.SearchData("長友")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

}

// MARK: - Private Function
private extension RoginViewController {
    
    func configSearchBar(){
        searchBar = UISearchBar()
        searchBar.placeholder = "キーワード検索"
        searchBar.showsCancelButton = true

        searchBar.delegate = self
        for subView in searchBar.subviews {
            for secondSubView in subView.subviews {
                if secondSubView.isKindOfClass(UITextField) {
                    secondSubView.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.3)
                }
            }
        }
        self.navigationItem.titleView = searchBar
    }

}

// MARK: - UISearchBarDelegate 
extension RoginViewController : UISearchBarDelegate{
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
