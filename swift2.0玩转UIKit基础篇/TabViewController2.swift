//
//  TabViewController2.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/25.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class TabViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "控件"
        self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()
        let backButton:UIBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backButton
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController.hidesBottomBarWhenPushed = true
    }

}
