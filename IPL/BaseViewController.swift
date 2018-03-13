//
//  BaseUiViewController.swift
//  IPL
//
//  Created by sibaprasad on 11/02/17.
//  Copyright © 2017 SP infotech. All rights reserved.
//this is a base class which is the parent class of all the Ui view controller class
// Here i declare all the common methods like showError,showProgress and all

import Foundation
import UIKit

class BaseViewController : UIViewController{
    
    override func viewDidLoad() {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showProgressDialog(_ message : String){
        var progressHud : ProgressHUD!
        progressHud  = ProgressHUD(text: message)
        self.view.addSubview(progressHud)
    }
    
    
    func showAlert(_ title :String,msg :String,isShowCancel : Bool) {
        let refreshAlert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        }))
        if isShowCancel {
            refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                print("Handle Cancel Logic here")
            }))
        }
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    
}
