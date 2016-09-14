//
//  ViewController.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//


import UIKit
import RxCocoa
import RxSwift
import TwitterKit

/**https://www.googleapis.com/youtube/v3/search?key=AIzaSyB_gsGxnsSjO_6rlJOeZX2LDZ3hosNY6m8&q=%E9%95%B7&part=snippet&maxResults=30&order=viewCount***/
class RoginViewController: UIViewController {

    private var searchBar : UISearchBar!
    @IBOutlet weak var resultTableView: UITableView!
    
    private let vm : ListViewModel = ListViewModel()
    let disposeBag = DisposeBag()
    
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSearchBar()
        
        configureTableView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

}
// MARK: Configure Function 
private extension RoginViewController {
    func configureTableView() {
        let results = searchBar.rx_text
            .asDriver()
            .flatMapLatest({ query in

                 self.vm.SearchDataItem(query)
                    .retry(3)
                    .asDriver(onErrorJustReturn: [])
                
            })
            .asDriver(onErrorJustReturn: [])
        
        
        
        // view binding (TableViewDataSourse)
        results.drive(resultTableView.rx_itemsWithCellIdentifier("Cell")) { (_,result,cell) in
            cell.textLabel?.text = result.snippet?.title
        }
        .addDisposableTo(disposeBag)
        
    }
    func configureSearchBar() {
        
    
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
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        
    }
    
}
