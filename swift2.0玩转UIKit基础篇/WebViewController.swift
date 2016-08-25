//
//  WebViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/23.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    let webView:UIWebView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "演示WebView"
        
        webView.frame = CGRectMake(0,95,self.view.frame.size.width,self.view.frame.size.height-95)
        webView.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.baidu.com/")!))
        //xCode7开始，默认只能使用https，要使用http的，需要去info.plist中，在App Transport Security Settings字典中，将Allow Arbitrary Loads键值设置为true
        self.view.addSubview(webView)
        let backButton:UIButton = UIButton(type: .Custom)
        backButton.frame = CGRectMake(10,65,80,30)
        backButton.backgroundColor = UIColor.redColor()
        backButton.setTitle("back", forState: .Normal)
        backButton.addTarget(self, action: #selector(goBack), forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton)
        let forwardButton:UIButton = UIButton(type: .Custom)
        forwardButton.frame = CGRectMake(100,65,80,30)
        forwardButton.backgroundColor = UIColor.redColor()
        forwardButton.setTitle("forward", forState: .Normal)
        forwardButton.addTarget(self, action: #selector(goForward), forControlEvents: .TouchUpInside)
        self.view.addSubview(forwardButton)
        let reloadButton:UIButton = UIButton(type: .Custom)
        reloadButton.frame = CGRectMake(190,65,80,30)
        reloadButton.backgroundColor = UIColor.redColor()
        reloadButton.setTitle("reload", forState: .Normal)
        reloadButton.addTarget(self, action: #selector(reload), forControlEvents: .TouchUpInside)
        self.view.addSubview(reloadButton)
    }
    
    func goBack(){
        if(webView.canGoBack){
            webView.goBack()
        }
    }
    func goForward(){
        if(webView.canGoForward){
            webView.goForward()
        }
    }
    func reload(){
        webView.reload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
