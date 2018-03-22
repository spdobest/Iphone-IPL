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
    var progressHud : ProgressHUD!
    override func viewDidLoad() {
       progressHud  = ProgressHUD(text: "Loading...")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showProgressDialog(_ message : String){
        if(progressHud == nil){
             progressHud  = ProgressHUD(text: message)
             progressHud.setTitle(message: message)
            self.view.addSubview(progressHud)
        }
        progressHud.setTitle(message: message)
        self.view.addSubview(progressHud)
        
        progressHud.show()
    }
    
    func hideProgress()  {
        if(progressHud != nil){
            progressHud.hide()
        }
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
