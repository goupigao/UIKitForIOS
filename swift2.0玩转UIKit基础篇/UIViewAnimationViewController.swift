//
//  UIViewAnimationViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/25.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class UIViewAnimationViewController: UIViewController {
    //MARK: 全局变量和常量
    @IBOutlet weak var contentView: UIView!
    var mFirstView: UIView!
    var mFirstViewFrame = CGRect(x: 8, y: 8, width: 150, height: 30)
    var mFirstViewBgColor = UIColor.purpleColor()
    var mFirstSubView: UIView!
    var mFirstSubViewFrame = CGRect(x: 5, y: 5, width: 20, height: 20)
    
    var replaceView:UIView!
    
    var mSecondView: UIView!
    var mSecondViewFrame = CGRect(x: 8, y: 48, width: 150, height: 10)
    
    var mThirdView: UIView!
    var mThirdViewFrame = CGRect(x: 8, y: 58, width: 150, height: 10)
    
    var mFourthView: UIView!
    var mFourthViewFrame = CGRect(x: 8, y: 68, width: 150, height: 10)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "演示UIViewAnimation"
        
        mFirstView = UIView(frame: mFirstViewFrame)
        mFirstView.backgroundColor = mFirstViewBgColor
        mFirstSubView = UIView(frame: mFirstSubViewFrame)
        mFirstSubView.backgroundColor = UIColor.whiteColor()
        mFirstView.addSubview(mFirstSubView)
        contentView.addSubview(mFirstView)
        
        replaceView = UIView(frame: mFirstViewFrame)
        replaceView.backgroundColor = UIColor.cyanColor()
        
        mSecondView = UIView(frame: mSecondViewFrame)
        mSecondView.backgroundColor = UIColor.redColor()
        contentView.addSubview(mSecondView)
        
        mThirdView = UIView(frame: mThirdViewFrame)
        mThirdView.backgroundColor = UIColor.greenColor()
        contentView.addSubview(mThirdView)
        
        mFourthView = UIView(frame: mFourthViewFrame)
        mFourthView.backgroundColor = UIColor.blueColor()
        contentView.addSubview(mFourthView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:动画操作视图属性的三个方法：
    //1.beginCommit方法（iOS4.1及以下）
    @IBAction func startBtnClick1(sender: AnyObject) {
        UIView.beginAnimations("testAnimate", context: nil)
        UIView.setAnimationDuration(1)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(10)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStopSelector(#selector(animationDidStop(_:finished:)))
        mFirstView.backgroundColor = UIColor.magentaColor()
        UIView.commitAnimations()
    }
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        print("动画播放完成")
    }
    //2.Block方法：可以在一个动画中操作多个View，当操作开始执行的时候，会开启新的线程，避免阻塞主线程
    @IBAction func startBtnClick2(sender: AnyObject) {
        UIView.animateWithDuration(1, delay: 0, options: [.CurveEaseInOut ,.Repeat], animations: {
            self.mFirstView.frame.origin.x += 60
        }) { (true) in
            print("动画播放完成")
        }
        //UIViewAnimationOptions分3类：
        //1.动画控制相关：如LayoutSubviews（子控件一起动画），AllowUserInteraction（动画时允许用户交互）等
        //2.时间曲线相关：如CurveEaseInOut等
        //3.转场效果相关：如TransitionFlipFromLeft（从左翻转）等
    }
    //3.Nest方法（嵌套Block）：子Block会默认继承父Block的duration、curve等属性
    @IBAction func startBtnClick3(sender: AnyObject) {
        UIView.animateWithDuration(1, delay: 0, options: [.CurveEaseInOut], animations: {
            self.mFirstView.frame.origin.x += 60
            UIView.animateWithDuration(5, delay: 0, options: [.CurveLinear], animations: {
                self.mSecondView.frame.origin.x += 60
            }, completion: nil)//未重写属性，5秒及CurveLinear的设置均不会生效
            UIView.animateWithDuration(1, delay: 0, options: [.OverrideInheritedCurve,.CurveLinear], animations: {
                self.mThirdView.frame.origin.x += 60
            }, completion: nil)//重写Curve属性
            UIView.animateWithDuration(5, delay: 0, options: [.OverrideInheritedDuration,.OverrideInheritedCurve,.CurveLinear], animations: {
                self.mFourthView.frame.origin.x += 60
            }, completion: nil)//重写Duration和Curve属性
        }, completion: nil)
    }
    
    //MARK:视图转场动画(过渡动画)
    //操作subView
    @IBAction func startBtnClick4(sender: AnyObject) {
        UIView.transitionWithView(mFirstView, duration: 2, options: [.TransitionCurlUp,.AllowAnimatedContent], animations: {
            self.mFirstSubView.frame.origin.x += 120
            }, completion: nil)
        //转场动画TransitionCurlUp表示向上翻页
        //如果不设置AllowAnimatedContent，那么animations中的动画将在转场动画完成之后的瞬间完成重绘，显得特别突兀
    }
    //替换View
    @IBAction func startBtnClick5(sender: AnyObject) {
        UIView.transitionFromView(mFirstView, toView: replaceView, duration: 2, options: .TransitionCrossDissolve, completion: nil)
    }
    
    //MARK:回退动画
    @IBAction func fallbackBtnClick1(sender: AnyObject) {
        mFirstView.backgroundColor = mFirstViewBgColor//恢复初始的背景色
        mFirstView.frame = mFirstViewFrame//恢复初始的frame
        mFirstSubView.frame = mFirstSubViewFrame
        mSecondView.frame = mSecondViewFrame
        mThirdView.frame = mThirdViewFrame
        mFourthView.frame = mFourthViewFrame
        mFirstView.layer.removeAllAnimations()//移除所有动画
        mSecondView.layer.removeAllAnimations()
        mThirdView.layer.removeAllAnimations()
        mFourthView.layer.removeAllAnimations()
        UIView.transitionFromView(replaceView, toView:mFirstView , duration: 0, options: .TransitionNone, completion: nil)//替换回原始的View
    }
}
