//
//  NavigationViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/22.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class NavigationViewController: UIViewController {
    @IBOutlet weak var msgTextField: UITextField!
    @IBOutlet weak var saveMessage: UIButton!
    var msg:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "演示导航"
        let barR1 = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(back))
        let barR2 = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItems = [barR1,barR2]
        msgTextField.text = msg ?? ""
    }
    
    func add() {
        print("你点击了增加按钮")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    //返回上页（sence，场景）
    func back() {
        /*
         presentedViewController和presentingViewController，他们分别是被present的控制器和正在presenting的控制器。
         比如说，控制器A和B，[A presentViewController B animated：YES completion：nil]，那么：
         A相对于B就是presentingViewController（B.presentingViewController = A）
         B相对于A就是presentedViewController（A.presentedViewController = B）
         */
        if presentingViewController == nil {
            self.navigationController?.popViewControllerAnimated(true)
            //调用UINavigationController的popViewControllerAnimated方法退出
        }else {
            dismissViewControllerAnimated(true, completion: nil)
            //调用dismissViewControllerAnimated方法退出；
        }
    }
    //重写prepareForSegue方法，若是由按钮“保存”触发的，则准备回传数据。调用页面如何接受数据，请看ViewController中的unwindToMain方法
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(saveMessage === sender){
            msg = msgTextField.text
        }
    }
}
