//
//  CycleViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/21.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class CycleViewController: UIViewController {
    
    var tmp:Int = 0
    
    override func loadView() {
        super.loadView()
        tmp+=1
        print(tmp,"loadView")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "演示控制器生命周期"
        tmp+=1
        print(tmp,"viewDidLoad")
    }
    
    //视图将要展示的时候调用该方法
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tmp+=1
        print(tmp,"viewWillAppear")
    }
    
    //将要布局子视图的时候调用该方法（一个奇怪的现象：如果是通过storyboard进入的，那么退出时，也会调用该方法）
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tmp+=1
        print(tmp,"viewWillLayoutSubviews")
    }
    
    //子视图已经布局完成的时候调用该方法（一个奇怪的现象：如果是通过storyboard进入的，那么退出时，也会调用该方法）
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tmp+=1
        print(tmp,"viewDidLayoutSubviews")
    }
    
    //视图已经展示的时候调用该方法
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tmp+=1
        print(tmp,"viewDidAppear")
    }
    
    //视图将要消失的时候调用该方法
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        tmp+=1
        print(tmp,"viewWillDisappear")
    }
    
    //视图已经消失的时候调用该方法
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        tmp+=1
        print(tmp,"viewDidDisappear")
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
