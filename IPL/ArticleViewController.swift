//
//  ArticleViewController.swift
//  IPL
//
//  Created by sibaprasad on 16/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
import UIKit
class ArticleViewController : BaseViewController {
    
    @IBOutlet weak var myTable: UITableView!
    
    
     var articles:[Article] = []
    
    override func viewDidLoad() {
        //  labelMessage.text = myValue
      //  view.addSubview(myActivityIndicator)
        
        parseBlog()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func parseBlog() {
        
//        self.view.addSubview(progressHud)
//        progressHud.show()
        
        showProgressDialog("Loading")
        
        let urlContacts = "http://roadfiresoftware.com/feed/json"
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
           //  self.myTable.reloadData()
            DispatchQueue.main.async {
                self.myTable.reloadData()
            }
            
           // self.myTable.reloadData()
            
            }.resume()
    }
    
   
    
}
extension ArticleViewController : UITableViewDataSource {
    /**
     ALL TABLE VIEW RELATED METHODS`
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //        let cell = tableView .dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ArticleTableViewCell
        //
        let cell : ArticleTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ArticleTableViewCell
        
        // [tableView, dequeueReusableCell(withIdentifier: "myCell", for: indexPath)] as! ArticleTableViewCell
        
        // UITableViewCell(style: UITableViewCellStyle.default,reuseIdentifier: "myCell") as! ArticleTableViewCell
        
        
        cell.labelTitle.text = self.articles[indexPath.row].title
        cell.labelDesc.text = self.articles[indexPath.row].id
        
        return cell
    }
}

extension ArticleViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 96
    }
}

