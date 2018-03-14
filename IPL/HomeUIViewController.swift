//
//  HomeUIViewController.swift
//  IPL
//
//  Created by sibaprasad on 12/02/17.
//  Copyright © 2017 SP infotech. All rights reserved.
//

import Foundation
import UIKit

class HomeUIViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    var articles:[Article] = []
    
    @IBOutlet weak var myTableView: UITableView!
    
    var commonutility = CommonUtility()
    var progressHud : ProgressHUD!
    var myActivityIndicator: UIActivityIndicatorView!
    
 //   @IBOutlet weak var labelMessage: UILabel!
    var myValue = ""
    
    override func viewDidLoad() {
      //  labelMessage.text = myValue
        view.addSubview(myActivityIndicator)
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        print(myValue)
        
        
        parseBlog()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func parseBlog() {
        
        self.view.addSubview(progressHud)
        progressHud.show()
        
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
            self.articles = blog.articles
            for article in blog.articles {
                print("- \(article.title)")
            }
        
            }.resume()
    }
    
    /**
     ALL TABLE VIEW RELATED METHODS`
 */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: "myCell") as! MyTableViewCell
        
    //    cell.myTitle.text = self.articles[indexPath.row].title
        
        return cell
    }
}
