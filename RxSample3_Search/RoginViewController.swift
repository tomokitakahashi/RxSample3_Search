//
//  ViewController.swift
//  RxSample3_Search
//
//  Created by takahashi tomoki on 2016/09/13.
//  Copyright © 2016年 takahashi tomoki. All rights reserved.
//


import UIKit
import TwitterKit


class RoginViewController: UIViewController {

    @IBOutlet weak var roginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        twitterRoginSet()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

}

// MARK: - Private Function
private extension RoginViewController {
    func twitterRoginSet(){
        print("Rogin Set")
        roginButton = TWTRLogInButton(logInCompletion: { session , error in
            guard let complete = session else {
                print("error !!")
                return print(error?.localizedDescription)
            }
            
            print("complete")
            print(complete.userName)
        })
    }
    
}

