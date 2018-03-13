//
//  ViewController.swift
//  IPL

//
//  Created by sibaprasad on 11/02/17.
//  Copyright © 2017 SP infotech. All rights reserved.
//

import UIKit
import Alamofire



class LoginViewController: BaseViewController {
 
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var segmentSIgninSIgnUp:
    UISegmentedControl!
    
    @IBOutlet var textFieldsPassword: UITextField!
    
    @IBOutlet var buttonSignIn: UIButton!
    @IBOutlet var textFieldName: UITextField!
    
    var commonutility = CommonUtility()
    var progressHud : ProgressHUD!
    var myActivityIndicator: UIActivityIndicatorView!
    
    var loginType:Int = 0
    
    private let SIGNIN = 0
    private let SIGNUP = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldName.isHidden = true
                // Do any additional setupÔ after loading the view, typically from a nib.
        progressHud  = ProgressHUD(text: "Loading...")
            //    self.view.addSubview(progressHud)
        myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        myActivityIndicator.center = view.center
        
        view.addSubview(myActivityIndicator)
        
       // doNetworkCall(url:"asdasdas")
        parse()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignInOrSignUpClick(_ sender: AnyObject) {
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
                Alamofire.request("https://api.androidhive.info/contacts/").response { response in
                    print("Request: \(response.request)")
                    print("Response: \(response.response)")
                    print("Error: \(response.error)")

                    if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                        print("Data: \(utf8Text)")
                    }
                }
                
                performSegue(withIdentifier: "loginSegue", sender: self)
                
            }
         //   myActivityIndicator.startAnimating()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var welcomeVc = segue.destination as! HomeUIViewController
        welcomeVc.myValue = "Sibaprasad"
    }
    
    @IBAction func onSegmentChange(_ sender: AnyObject) {
        switch sender.selectedSegmentIndex {
        case 0:
            loginType = SIGNIN
            textFieldName.isHidden = true
            buttonSignIn.setTitle("Sign In",for: .normal)
        case 1:
            loginType = SIGNUP
            textFieldName.isHidden = false
            buttonSignIn.setTitle("Sign Up", for: .normal)
        default:
            break;
        }
        
    }
    
    
    func doNetworkCall(url:String)  {
        
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                
                print("Result ",responseData.result.value)
                
                
                do {
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(MyContacts.self, from: responseData.result.value as! Data)
                    print(gitData.contacts![0])
                    
                } catch let err {
                    print("Err", err)
                }
                
                //                let swiftyJsonVar = JSON(responseData.result.value!)
                //
                //                if let resData = swiftyJsonVar["contacts"].arrayObject {
                //                    self.arrRes = resData as! [[String:AnyObject]]
                //                }
                //                if self.arrRes.count > 0 {
                //                    self.netTableView.reloadData()
                //                }
        
            }
        }
    }
    func parse(){
        
        guard let gitUrl = URL(string: "https://api.github.com/users/"+"shashikant86" ) else { return }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            
            guard let data = data else { return }
            do {
                
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(MyGitHub.self, from: data)
                
                print(gitData.location)
                
                DispatchQueue.main.sync {
                    if let gimage = gitData.avatarUrl {
                        let data = try? Data(contentsOf: gimage)
                        let image: UIImage = UIImage(data: data!)!
                      //  self.gravatarImage.image = image
                    }
                    
                    
//                    if let gname = gitData.name {
//                        self.name.text = gname
//                    }
//                    if let glocation = gitData.location {
//                        self.location.text = glocation
//                    }
//
//                    if let gfollowers = gitData.followers {
//                        self.followers.text = String(gfollowers)
//                    }
//
//                    if let grepos = gitData.repos {
//                        self.blog.text = String(grepos)
//                    }
//                    self.setLabelStatus(value: false)
                }
                
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
}



