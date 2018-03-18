//
//  DetailsArticleVC.swift
//  IPL
//
//  Created by sibaprasad on 18/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
import UIKit
class DetailsArticleVC : BaseViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    
    var getName = String()
    var getImage = UIImage()
    
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func viewDidLoad() {
        label.text = getName
        imageView.image = getImage
          imageView.layer.cornerRadius = imageView.frame.height/2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
}
