//
//  ArticleViewController.swift
//  IPL
//
//  Created by sibaprasad on 16/03/18.
//  Copyright © 2018 SP infotech. All rights reserved.
//

import Foundation
import UIKit
class ArticleViewController : BaseViewController,UITableViewDataSource {
    
    
    let images = ["bear.jpeg","camel.jpeg","goat.jpeg","leopard.jpg","lion.jpg","panda.jpg","puppy.jpeg","rabit.jpeg","zebra.jpeg","ziraf.jpeg"]
    var imageArray = [UIImage]()
    
    @IBOutlet weak var myTable: UITableView!
    
    
     var articles:[Article] = [Article]()
    
    override func viewDidLoad() {
        //  labelMessage.text = myValue
      //  view.addSubview(myActivityIndicator)
        imageArray = [#imageLiteral(resourceName: "bear.jpeg"),#imageLiteral(resourceName: "camel.jpeg"),#imageLiteral(resourceName: "goat.jpeg"),#imageLiteral(resourceName: "leopard.jpg"),#imageLiteral(resourceName: "lion.jpg"),#imageLiteral(resourceName: "panda.jpg"),#imageLiteral(resourceName: "puppy.jpeg"),#imageLiteral(resourceName: "puppy.jpeg"),#imageLiteral(resourceName: "rabit.jpeg"),#imageLiteral(resourceName: "zebra.jpeg"),#imageLiteral(resourceName: "ziraf.jpeg")]
        parseBlog()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func parseBlog() {
        
//        self.view.addSubview(progressHud)
//        progressHud.show()
        
        showProgressDialog("Loading...")
        
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
         //   self.articles = blog.articles
            self.articles.append(contentsOf: blog.articles)
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
    
    /**
     ALL TABLE VIEW RELATED METHODS`
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell : ArticleTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "myCell") as? ArticleTableViewCell
        
        cell.viewCell.layer.cornerRadius = cell.viewCell.frame.height/2
        
        if(indexPath.row == articles.count-1){
            parseBlog()
        }
        
        cell.labelTitle.text = self.articles[indexPath.row].title
        cell.articleImage.image = imageArray[indexPath.row%9] //self.articles[indexPath.row].id
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name:"Main",bundle:nil)
        
        let dvc = storyboard.instantiateViewController(withIdentifier: "DetailsArticle") as! DetailsArticleVC
        
        
        dvc.getImage = imageArray[indexPath.row%9]
        dvc.getName = "Sibaprasad"

        self.navigationController?.pushViewController(dvc, animated: true)
    }
    
} 

extension ArticleViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

