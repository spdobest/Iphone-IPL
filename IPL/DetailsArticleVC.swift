import Foundation
import UIKit
class DetailsArticleVC : BaseViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet var webview: UIWebView!
    
    
    var getName = String()
    var getUrl = String()
    var getImage = UIImage()
    
    
    override func didReceiveMemoryWarning() {
        
    }
    
    override func viewDidLoad() {
        label.text = getName
        imageView.image = getImage
        imageView.layer.cornerRadius = imageView.frame.height/2
        
        let url = URL (string: getUrl)
        let requestObj = URLRequest(url: url!)
        webview.loadRequest(requestObj)
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
    }
    
    func webViewDidStartLoad(webView: UIWebView!){ // show indicator
        showProgressDialog("Loading")
    }
    func webViewDidFinishLoad(webView: UIWebView!) {// hide indicator
        hideProgress()
    }
    func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {// hide indicator
        
    }
    
}
