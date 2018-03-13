//
//  HomeUIViewController.swift
//  IPL
//
//  Created by sibaprasad on 12/02/17.
//  Copyright © 2017 SP infotech. All rights reserved.
//

import Foundation
import UIKit

class HomeUIViewController: BaseViewController {
    
    @IBOutlet weak var labelMessage: UILabel!
    var myValue = ""
    
    override func viewDidLoad() {
        labelMessage.text = myValue
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
