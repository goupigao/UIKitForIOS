//
//  TabViewController1.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/25.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class TabViewController1: UIViewController {
    @IBOutlet weak var msgTextField: UITextField!//在storyboard用ctrl+鼠标单击拖拽UITextField，生成一个outlet

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "导航"
        self.tabBarController?.tabBar.tintColor = UIColor.greenColor()
        self.navigationController?.navigationBar.tintColor = UIColor.orangeColor()//设置导航按钮的渲染颜色
        self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()//设置导航栏的渲染颜色
        let backButton:UIBarButtonItem = UIBarButtonItem(title: "返回", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(back))//假如#selector调用的是其他控制器中的方法，在方法前加上控制器名即可，比如ViewController.back
        self.navigationItem.backBarButtonItem = backButton//设置backBarButtonItem可以改写返回按钮的UI，但是无法改写按钮的方法，系统会在内部再实现一遍返回按钮的预定义方法，因此即使back()函数未做任何实现，依然可以实现返回效果
        //self.navigationItem.leftBarButtonItem = backButton//若想完全自定义返回按钮，可以设置leftBarButtonItem，但是该按钮并不在本控制器内设置，而是在需要显示该按钮的控制器内进行设置，若同时设置了这两个UIBarButtonItem，那么leftBarButtonItem会覆盖backBarButtonItem
    }
    
    func back() {
        //do nothing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    //导航方法一：在storyboard用ctrl+鼠标单击拖拽按钮“导航一”，创建一个Segue（比如show）指向NavigationViewController的导航管理器
    //导航方法二（同时传递数据）：在storyboard用ctrl+鼠标单击拖拽按钮“导航二（并传数据）”，创建一个Segue（比如show）指向NavigationViewController本身，将该Segue命名为ctrlDragSegueToViewController
    //重写prepareForSegue方法
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.destinationViewController.hidesBottomBarWhenPushed = true//隐藏二级页面中底部的Bar
        if segue.identifier == "ctrlDragSegueToViewController" {
            let navigationViewController = segue.destinationViewController as! NavigationViewController
            navigationViewController.msg = msgTextField.text
        }
    }
    //导航方法三（同时传递数据）：在storyboard用ctrl+鼠标单击拖拽按钮“导航三（并传数据）”，创建一个action（action的名字比如填入nButton）。并且将storyboard中NavigationViewController这一scene的storyboard id设为“nStoryboard”（在identity inspector中设置）。
    @IBAction func nButton(sender: AnyObject) {
        let navigationViewController = self.storyboard?.instantiateViewControllerWithIdentifier("nStoryboard") as! NavigationViewController
        navigationViewController.hidesBottomBarWhenPushed = true
        navigationViewController.msg = msgTextField.text
        self.navigationController?.pushViewController(navigationViewController, animated: true)//push方法创建一个Segue，已不推荐使用
    }
    //回传数据的方法：
    //1.在本控制器（ViewController）中添加下面的方法unwindToMain:
    //2.在NavigationViewController的storyboard中，用ctrl+鼠标单击拖拽按钮“保存”至scene顶部的Exit按钮，在弹出的选择框中，选择1中创建的方法unwindToMain:
    //3.在NavigationViewController中重写prepareForSegue方法，若是由按钮“保存”触发的，则准备回传数据
    @IBAction func unwindToMain(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? NavigationViewController, msg = sourceViewController.msg {
            msgTextField.text = msg
        }
    }

}
