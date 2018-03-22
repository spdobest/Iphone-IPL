//
//  ViewController.swift
//  IPL

//
//  Created by sibaprasad on 11/02/17.
//  Copyright © 2017 SP infotech. All rights reserved.
//

import UIKit




class LoginViewController: BaseViewController {
 
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var segmentSIgninSIgnUp:
    UISegmentedControl!
    
    @IBOutlet var textFieldsPassword: UITextField!
    
    @IBOutlet var buttonSignIn: UIButton!
    @IBOutlet var textFieldName: UITextField!
    
    var commonutility = CommonUtility()
    
    
    
    var loginType:Int = 0
    
    private let SIGNIN = 0
    private let SIGNUP = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
      //   doNetworkCall(url:"asdasdas")
//        parse()
//parseContact()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignInOrSignUpClick(_ sender: AnyObject) {
        
        showProgressDialog("Loading...")
        
        let strEmail:String = textFieldEmail.text!
        let strPwd:String = textFieldsPassword.text!
        let strName:String = textFieldName.text!
        
        
        let str:String? = buttonSignIn.currentTitle
        
        if(str == "Login"){
            loginType = SIGNIN
        }
        else{
            loginType = SIGNUP
        }

        if !commonutility.isInternetAvailable() {
            showAlert("Error",msg: "Check Internet Connection",isShowCancel: false)
        }
        else if ( loginType == SIGNIN && (strEmail=="" || strPwd=="")) {
            showAlert("Error",msg: "Email and Password Cant be Empty",isShowCancel: false)
        }
        else if ( loginType == SIGNUP && (strEmail=="" || strPwd=="" || strName == "")) {
            showAlert("Error",msg: "Email and Password Cant be Empty",isShowCancel: false)
        }
        else if !commonutility.isValidEmail(strEmail){
            showAlert("Error",msg: "Invaid Email Id",isShowCancel: false)
        }
        else if strPwd.characters.count<6{
            showAlert("Error",msg: "Password Length must be minimum 6",isShowCancel: false)
        }
        else{
            self.view.addSubview(progressHud)
            progressHud.show()
            if loginType == SIGNUP {
//                Alamofire.request("https://api.androidhive.info/contacts/").response { response in
//                    print("Request: \(response.request)")
//                    print("Response: \(response.response)")
//                    print("Error: \(response.error)")
//
//                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                        print("Data: \(utf8Text)")
//                    }
//                }
                
               
                
            }
         //   myActivityIndicator.startAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
        case "article"?:
            let welcomeVc = segue.destination as! ArticleViewController
           // welcomeVc.myValue = "Sibaprasad"
        case "asd"?:
            print("adasdas")
        default :
            print("default")
        }
        
       
    }
    
    @IBAction func onSegmentChange(_ sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            loginType = SIGNIN
            textFieldName.isHidden = true
            buttonSignIn.setTitle("Sign In",for: .normal)
            
            performSegue(withIdentifier: "article", sender: self)
            
        case 1:
            loginType = SIGNUP
            textFieldName.isHidden = false
            buttonSignIn.setTitle("Sign Up", for: .normal)
        default:
            break;
        }
        
    }
    
    
//    func doNetworkCall(url:String)  {
//        
//        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//
//                print("Result ",responseData.result.value)
//
//
//                do {
//                    let decoder = JSONDecoder()
//                    let gitData = try decoder.decode(MyContacts.self, from: responseData.result.value as! Data)
//                    print(gitData.contacts[0].address)
//
//                } catch let err {
//                    print("Err", err)
//                }
//
//                                let swiftyJsonVar = JSON(responseData.result.value!)
//
//                                if let resData = swiftyJsonVar["contacts"].arrayObject {
//                                    self.arrRes = resData as! [[String:AnyObject]]
//                                }
//                                if self.arrRes.count > 0 {
//                                    self.netTableView.reloadData()
//                                }
//
//            }
//        }
//    }
    func parse(){
        
        showProgressDialog("Loading...")
        
        var urlGit = "https://api.github.com/users/spdobest"
        guard let gitUrl = URL(string: "https://api.github.com/users/shashikant86") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(MyGitHub.self, from: data)
                print(gitData.name!)
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
    func parseContact(){
        
        var urlContacts = "http://roadfiresoftware.com/feed/json"
        guard let gitUrl = URL(string: urlContacts) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            guard let data = data else {
                print("Error: No data to decode")
                return
            }
            
            guard let blog = try? JSONDecoder().decode(Blog.self, from: data) else {
                print("Error: Couldn't decode data into Blog")
                return
            }
            
            print("blog title: \(blog.title)")
            print("blog home: \(blog.homepageURL)")
            
            print("articles:")
            for article in blog.articles {
                print("- \(article.title)")
            }
            
            }.resume()
    }
    
}



