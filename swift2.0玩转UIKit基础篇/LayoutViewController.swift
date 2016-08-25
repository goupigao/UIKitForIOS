//
//  LayoutViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/24.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class LayoutViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "演示Auto Layout和Size Classes"
        textView.layer.borderWidth = 2
        textView.layer.borderColor = UIColor.greenColor().CGColor
        textView.layer.cornerRadius = 10
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
