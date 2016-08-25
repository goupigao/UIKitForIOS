//
//  CoreAnimationViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/25.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class CoreAnimationViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    var myLayer: CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "演示CoreAnimation"
        
        initCALayer()
    }
    
    func initCALayer(){
        myLayer = CALayer()
        myLayer.frame = CGRectMake(40, 40, 80, 80)
        myLayer.backgroundColor = UIColor.magentaColor().CGColor
        myLayer.borderWidth = 2
        myLayer.borderColor = UIColor.orangeColor().CGColor
        myLayer.cornerRadius = 10
        myLayer.shadowOffset = CGSizeMake(5,5)
        myLayer.shadowOpacity = 0.5
        myLayer.shadowColor = UIColor.blackColor().CGColor
        scrollView.layer.addSublayer(myLayer)
    }
    
    //MARK:隐式动画
    //无法控制时间等属性
    @IBAction func implictAnimation(sender: AnyObject) {
        myLayer.position.y += 30
    }
    
    //MARK:显式动画
    //可以控制时间等属性
    @IBAction func basicAnimation(sender: AnyObject) {
        let imgView = UIImageView(image: UIImage(named: "cloud01"))
        imgView.frame = CGRectMake(40, 130, 120, 80)
        scrollView.addSubview(imgView)
        //1.创建角色
        let layer = imgView.layer
        //2.写剧本一，用来缩放
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.5
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 1.0
        //3.写剧本二，用来改变透明度
        let opaqueAnimate = CABasicAnimation(keyPath: "opacity")
        opaqueAnimate.fromValue = 0.0
        opaqueAnimate.toValue = 1.0
        opaqueAnimate.autoreverses = true
        opaqueAnimate.repeatCount = MAXFLOAT
        opaqueAnimate.duration=1.0
        //4.角色按剧本演戏
        layer.addAnimation(scaleAnimate, forKey: "scaleAnimate")
        layer.addAnimation(opaqueAnimate, forKey: "opaqueAnimate")
    }
    
    //MARK:关键帧动画
    //类似Flash动画，有关键帧（节点帧）
    @IBAction func keyFrameAnimation(sender: AnyObject) {
        let imgView = UIImageView(image: UIImage(named: "filledStar"))
        imgView.frame = CGRectMake(40, 220, 30, 30)
        scrollView.addSubview(imgView)
        //1.创建角色
        let layer = imgView.layer
        //2.写剧本，设定关键帧，画正方形
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        let value0 = NSValue(CGPoint: layer.position)
        let value1 = NSValue(CGPoint: CGPointMake(layer.position.x+100, layer.position.y))
        let value2 = NSValue(CGPoint: CGPointMake(layer.position.x+100, layer.position.y+100))
        let value3 = NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y+100))
        keyAnimate.values = [value0,value1,value2,value3,value0]
        let tf0 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)//第一段轨迹，加速进入减速出去
        let tf1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)//第二段轨迹，加速进入
        let tf2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)//第三段轨迹，减速出去
        let tf3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)//第四段轨迹，匀速
        keyAnimate.timingFunctions = [tf0,tf1,tf2,tf3]
        keyAnimate.keyTimes = [0.0,0.5,0.6,0.7,1]//duration在每段轨迹的时间分配
        keyAnimate.autoreverses = false
        keyAnimate.repeatCount = MAXFLOAT
        keyAnimate.duration = 6
        //3.角色按剧本演戏
        layer.addAnimation(keyAnimate, forKey: "keyAnimate")
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
