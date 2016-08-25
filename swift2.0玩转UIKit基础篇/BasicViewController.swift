//
//  BasicViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/21.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class BasicViewController: UIViewController,UIScrollViewDelegate,UISearchBarDelegate,UITextFieldDelegate,UIAlertViewDelegate,UIActionSheetDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate {
    let scrollView:UIScrollView = UIScrollView()
    let imageView:UIImageView = UIImageView()
    let viewBlue:UIView = UIView()
    let viewRed:UIView = UIView()
    let activity:UIActivityIndicatorView = UIActivityIndicatorView()
    let stepper:UIStepper = UIStepper()
    let stepperValue:UILabel = UILabel()
    let alertView:UIAlertView = UIAlertView()
    let alertController1:UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .Alert)//Alert风格
    let actionSheet:UIActionSheet = UIActionSheet()
    let alertController2:UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)//ActionSheet风格
    var pickerArray:Array<String>?
    //MARK:创建searchBar、textField对象，并在点击屏幕其他位置时，缩回软键盘
    let searchBar:UISearchBar = UISearchBar()
    let textField:UITextField = UITextField()
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        searchBar.resignFirstResponder()//注销searchBar的第一响应，从而收回软键盘
        textField.resignFirstResponder()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "演示ScrllView和基础控件"
        initScrollView()
        initLabel()
        initButton()
        initImageView()
        initSearchBar()
        initSwitch()
        initTextField()
        initSegmentedControl()
        initSlider()
        initActivityIndicatorView()
        initProgressView()
        initPageControl()
        initStepper()
        initAlertView()
        initAlertController1()
        initActionSheet()
        initAlertController2()
        initTextView()
        initPickerView()
        initDataPicker()
    }
    
    //MARK:UIScrollView对象
    func initScrollView(){
        scrollView.frame = self.view.frame
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*3)
        scrollView.directionalLockEnabled = false//设置滑动时，是否只允许左右、上下、对角线滑动，而不允许其他斜向滑动
        scrollView.pagingEnabled = false//设置是否按页显示（比如电子书软件中翻页的用法）
        scrollView.scrollsToTop = true//设置是否允许点击状态栏返回视图的顶部
        scrollView.minimumZoomScale = 0.5//设置视图的最小缩放比例，需要通过代理实现，可用于实现缩放图片的功能
        scrollView.maximumZoomScale = 2
        scrollView.delegate = self
        self.view.addSubview(scrollView)
    }
    //设置scrollView的代理方法
    //当进行缩放操作时，返回需要缩放的视图
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }
    
    //MARK:UILabel对象
    func initLabel(){
        let label:UILabel = UILabel(frame: CGRectMake(0,0,200,80))//x,y,width,height
        label.text = "我是一个label，我喜欢ios，我喜欢iphone"
        label.font = UIFont.italicSystemFontOfSize(19)//字体大小，斜体
        label.textColor = UIColor.redColor()//字体颜色
        label.backgroundColor = UIColor.blueColor()//背景色
        label.textAlignment = NSTextAlignment.Center//文字居中对齐
        label.shadowColor = UIColor.orangeColor()//阴影色
        label.shadowOffset = CGSizeMake(1, 1)//阴影偏移量：x,y
        label.numberOfLines = 0//行数。0代表无限行
        //以下通过layer层设置边框，阴影
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.greenColor().CGColor
        label.layer.shadowColor = UIColor.purpleColor().CGColor
        label.layer.shadowOffset = CGSizeMake(3, 3)
        label.layer.shadowOpacity = 1
        scrollView.addSubview(label)
    }
    
    //MARK:UIButton对象
    func initButton(){
        let button:UIButton = UIButton(type: UIButtonType.Custom)//创建Button同时设置按钮的类型
        button.frame = CGRectMake(210, 40, 100, 40)
        button.setImage(UIImage(named: "emptyStar"), forState: .Normal)//按钮中的图像
        button.setTitle("按钮", forState: .Normal)//按钮中的标题
        button.setImage(UIImage(named: "filledStar"), forState: .Highlighted)//选中按钮时，按钮中的图像
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)//设置按钮中图像及标题的偏移量：top,left,bottom,right
        button.backgroundColor = UIColor.redColor()
        //button.setBackgroundImage(UIImage(named: "emptyStar"), forState: .Normal)//按钮的背景图像
        button.showsTouchWhenHighlighted = true;//打开按钮按下时的效果
        button.addTarget(self, action: #selector(swithActivityAnimating), forControlEvents: .TouchDown)
        //以下通过layer层设置圆角
        button.layer.masksToBounds = true//masksToBounds设置为true时，会对视图进行切割，此时若再设置layer的shadow相关属性，也会被切割掉，从而不会产生阴影效果
        button.layer.cornerRadius = 5
        scrollView.addSubview(button)
    }
    func swithActivityAnimating(){
        if(activity.isAnimating()){
            activity.stopAnimating()
        }else{
            activity.startAnimating()
        }
    }
    
    //MARK:UIActivityIndicatorView对象
    func initActivityIndicatorView(){
        activity.center = CGPointMake(260,18)//设置中心点
        activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge//设置样式
        activity.color = UIColor.greenColor()//设置颜色
        scrollView.addSubview(activity)
    }
    
    //MARK:UIImageView对象
    func initImageView(){
        imageView.frame = CGRectMake(0, 90, 120, 80)
        imageView.image = UIImage(named: "cloud01")
        //imageView.highlightedImage = UIImage(named: "cloud02")//设置高亮图片
        //imageView.highlighted = true//设置图片高亮显示
        //以下为设置帧动画
        var array:Array<UIImage!> = Array()
        for index in 1...6{
            let image:UIImage? = UIImage(named: String(format:"cloud0%d",index))
            array.append(image!)
        }
        imageView.animationImages = array as? [UIImage]//设置ImageView的动画数组
        imageView.animationRepeatCount = 0//设置动画播放的次数，0代表无限次
        imageView.animationDuration = 2//设置动画播放一轮的时间（以秒为单位）
        imageView.startAnimating()//开始播放动画
        scrollView.addSubview(imageView)
    }
    
    //MARK:UISearchBar对象
    func initSearchBar(){
        searchBar.frame = CGRectMake(130,90,190,30)
        searchBar.placeholder = "请输入关键字"
        searchBar.barStyle = UIBarStyle.Default//设置搜索栏样式
        searchBar.showsSearchResultsButton = true//设置显示某按钮
        searchBar.barTintColor = UIColor.blueColor()//设置搜索栏的颜色
        searchBar.tintColor = UIColor.redColor()//设置渲染颜色（包括输入提示符，ScopeBar）
        //以下为设置搜索栏的ScopeBar（范围栏，范围选择视图，附件视图）
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["1","2","3","4"]
        searchBar.delegate = self
        scrollView.addSubview(searchBar)
    }
    //设置searchBar的代理方法
    //当输入框文字变化时调用的方法
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchText: \(searchText)")//打印搜索框的输入值
    }
    //当输入的文字进入搜索框时调用的方法
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        print("text: \(text)")//打印每次输入的文字
        return true
    }
    //点击ScopeBar时调用的方法
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print(selectedScope)//打印索引值
    }
    //点击搜索按钮时触发的方法
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print("search: \(searchBar.text ?? "")")//打印搜索值
    }
    
    //MARK:UISwitch对象
    func initSwitch(){
        let mySwitch:UISwitch = UISwitch(frame: CGRectMake(0,190,100,100))
        mySwitch.thumbTintColor = UIColor.blackColor()//设置滑块的渲染颜色
        mySwitch.onTintColor = UIColor.blueColor()//设置开关开启时的渲染颜色
        mySwitch.tintColor = UIColor.purpleColor()//设置开关关闭时的渲染颜色（这里切换开关时，紫色慢慢消失，最终开关的边框是紫色的，里面还是白色的）
        mySwitch.addTarget(self, action: #selector(changeRootViewBgColor(_:)), forControlEvents: .ValueChanged)
        scrollView.addSubview(mySwitch)
    }
    func changeRootViewBgColor(swi:UISwitch){
        if swi.on{
            self.view.backgroundColor = UIColor.grayColor()
        }else{
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    //MARK:UITextField对象
    func initTextField(){
        textField.frame = CGRectMake(60,190,200,40)
        textField.borderStyle = UITextBorderStyle.Line//设置输入框的风格为line
        textField.placeholder = "请输入文字"
        textField.textColor = UIColor.redColor()
        textField.font = UIFont.boldSystemFontOfSize(20)//字体大小
        textField.textAlignment = NSTextAlignment.Center
        textField.clearsOnBeginEditing = false//每次重新开始编辑输入框时，是否清空输入框中的内容
        textField.adjustsFontSizeToFitWidth = true//当输入的字符要超出输入框长度时，自动缩小文字的大小去适应输入框的大小
        textField.minimumFontSize = 18//设置输入框中最小文字的大小，当配合上面的属性使用时，当达到最小文字大小时，不再缩小文字大小，而是滑动输入框中的文字
        //以下设置输入框的左视图（比如登录页面中用户名输入框前面的小人，密码输入框前面的钥匙符号等）
        let viewLeft:UIView = UIView(frame: CGRectMake(0,0,40,40))
        viewLeft.backgroundColor = UIColor.blueColor()
        textField.leftView = viewLeft
        textField.leftViewMode = UITextFieldViewMode.Always//左、右视图的显示模式，默认是Never，也就是不显示
        //以下设置附键盘视图(可在这里放入一些逻辑按钮，比如缩回键盘等)
        let board:UIView = UIView(frame: CGRectMake(0,0,320,40))
        board.backgroundColor = UIColor.orangeColor()
        textField.inputAccessoryView = board
        //textField.inputView = ***//这样可以设置自定义交互键盘替代软键盘，比如显示省份列表供用户选择
        textField.clearButtonMode = UITextFieldViewMode.Always//显示清空按钮
        textField.delegate = self
        scrollView.addSubview(textField)
    }
    //设置textField的代理方法
    //当输入的文字进入输入框时调用的方法
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        print("string: \(string)")//打印每次输入的文字
        return true
    }
    //当点击输入完成按钮时调用的方法
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("您输入了：\(textField.text ?? "")")
        textField.resignFirstResponder()
        return true
    }
    
    //MARK:UISegmentedControl对象
    func initSegmentedControl(){
        let seg:UISegmentedControl = UISegmentedControl(frame: CGRectMake(20,240,280,40))
        seg.insertSegmentWithTitle("第一个按钮（我很长我很长）", atIndex: 0, animated: true)
        seg.insertSegmentWithTitle("第二个按钮", atIndex: 1, animated: true)
        seg.setContentOffset(CGSizeMake(10,10), forSegmentAtIndex: 1)//设置segment中内容的偏移量
        seg.momentary = false//设置选中状态的显示是否是瞬时的
        seg.apportionsSegmentWidthsByContent = true//设置文字长度的自适应
        seg.tintColor = UIColor.redColor()//设置渲染颜色
        seg.addTarget(self, action: #selector(changeSeg(_:)), forControlEvents: .ValueChanged)
        scrollView.addSubview(seg)
        viewBlue.frame = CGRectMake(0,280,320,80)
        viewRed.frame = CGRectMake(0,280,320,80)
        viewBlue.backgroundColor = UIColor.blueColor()
        viewRed.backgroundColor = UIColor.redColor()
        scrollView.addSubview(viewBlue)
        scrollView.addSubview(viewRed)
        seg.selectedSegmentIndex = 0;//设置默认选中值
        scrollView.bringSubviewToFront(viewBlue)//将视图前置
    }
    func changeSeg(seg:UISegmentedControl) {
        if(seg.selectedSegmentIndex==0){
            scrollView.bringSubviewToFront(viewBlue)
        }else{
            scrollView.bringSubviewToFront(viewRed)
        }
    }
    
    //MARK:UISlider对象
    func initSlider(){
        let slider:UISlider = UISlider(frame: CGRectMake(20,370,280,40))
        slider.maximumValue = 100//设置最大、最小值
        slider.minimumValue = 0
        slider.minimumTrackTintColor = UIColor.redColor()//设置最小值到滑块之间的颜色
        slider.maximumTrackTintColor = UIColor.greenColor()//设置最大值到滑块之间的颜色
        slider.thumbTintColor = UIColor.orangeColor()//设置滑块的颜色
        slider.continuous = true//设置是否在滑动时持续触发
        slider.addTarget(self, action: #selector(changeImageSize(_:)), forControlEvents: .ValueChanged)
        scrollView.addSubview(slider)
        slider.setValue(1, animated: true)//设置Slider的值
    }
    func changeImageSize(slider:UISlider){
        let value:Float = 1-slider.value/100
        imageView.bounds = CGRectMake(0, 90, 120*(CGFloat)(value), 80*(CGFloat)(value))//用bounds而不是frame，这样在缩放时就会自动以图片中心为原点进行缩放
    }
    
    //MARK:UIProgressView对象
    func initProgressView(){
        let process:UIProgressView = UIProgressView(progressViewStyle: .Default)
        process.frame = CGRectMake(20, 420, 280, 20)
        process.progressTintColor = UIColor.redColor()//设置已经完成部分的颜色
        process.trackTintColor = UIColor.grayColor()//设置未完成部分的颜色
        scrollView.addSubview(process)
        process.progress = 0.5//设置processView的进度
    }
    
    //MARK:UIPageControl对象
    //该对象本身并不实现页面，仅用于控制页面
    func initPageControl(){
        let page:UIPageControl = UIPageControl(frame: CGRectMake(10,450,100,30))
        page.numberOfPages = 6
        page.hidesForSinglePage = true//若只有一页，则隐藏指示标示
        page.currentPageIndicatorTintColor = UIColor.redColor()//设置当前页的指示标示的渲染颜色
        page.pageIndicatorTintColor = UIColor.greenColor()//设置非当前页的指示标示的渲染颜色
        page.addTarget(self, action: #selector(changePage(_:)), forControlEvents: .ValueChanged)
        scrollView.addSubview(page)
        page.currentPage = 3//设置当前显示第几页（第一页的索引是0）
    }
    func changePage(page:UIPageControl){
        print("当前显示第\(page.currentPage+1)页")
    }
    
    //MARK:UIStepper对象
    func initStepper(){
        stepper.frame = CGRectMake(190,450,100,40)
        stepper.maximumValue = 10//设置最大、最小值及步长
        stepper.minimumValue = 0
        stepper.stepValue = 2
        stepper.autorepeat = true//设置值是否持续变化（若true，不松手时，值会一直增加或减少）
        stepper.continuous = true//设置是否连续触发（若true，则值变化时，即使未松手，也会立即响应在页面上）
        stepper.wraps = false//设置是否可以循环
        stepper.tintColor = UIColor.redColor()//设置渲染颜色
        stepper.addTarget(self, action: #selector(changeStepperValue(_:)), forControlEvents: .ValueChanged)
        scrollView.addSubview(stepper)
        stepperValue.frame = CGRectMake(130, 450, 50, 40)
        scrollView.addSubview(stepperValue)
    }
    func changeStepperValue(stepper:UIStepper){
        stepperValue.text = "\(stepper.value)"
    }
    
    /*
     iOS7及以下设备用UIAlertView、UIActionSheet，iOS8及以上设备用UIAlertController
     UIAlertController将alert和actionSheet整合在一个类中，并通过构造函数中的preferredStyle指定风格
     需要注意的是，UIAlertController在iOS7及以下设备运行时，会造成程序崩溃，因此若要兼容低版本系统，最好做一个判断，再根据系统版本指定运行哪段代码
     */
    //MARK:UIAlertView对象
    func initAlertView(){
        alertView.title = "提示"
        alertView.message = "这是旧版本的UIAlertView"
        alertView.delegate = self
        alertView.addButtonWithTitle("取消")
        alertView.addButtonWithTitle("确认")
        alertView.addButtonWithTitle("更多")
        alertView.alertViewStyle = .LoginAndPasswordInput//设置样式，这里设置为登录页面样式，但无法再自定义修改样式的属性
        let button1:UIButton = UIButton(type: UIButtonType.Custom)
        button1.frame = CGRectMake(5, 500, 140, 30)
        button1.setTitle("UIAlertView", forState: .Normal)
        button1.backgroundColor = UIColor.redColor()
        button1.addTarget(self, action: #selector(openAlertView), forControlEvents: .TouchUpInside)
        scrollView.addSubview(button1)
    }
    func openAlertView(){
        alertView.show()
    }
    //设置alertView的代理方法
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        print("点击了索引值为\(buttonIndex)的按钮")
    }
    
    //MARK:UIAlertController对象，用于Alert时
    func initAlertController1(){
        alertController1.title = "提示"
        alertController1.message = "这是新版本的UIAlertController"
        let cancelAlertAction:UIAlertAction = UIAlertAction(title: "取消", style: .Cancel) { (cancelButton) -> Void in
            print("点击了取消按钮")
        }//不同于UIAlertView（需要通过delegate来监听按钮事件），这里在设置按钮的同时，就可以通过闭包来设置按钮事件
        let sureAlertAction:UIAlertAction = UIAlertAction(title: "确认", style: .Default) { (sureButton) -> Void in
            print("点击了确认按钮")
        }
        let otherAlertAction:UIAlertAction = UIAlertAction(title: "更多", style: .Destructive) { (otherButton) -> Void in
            print("点击了更多按钮")
        }
        alertController1.addAction(cancelAlertAction)
        alertController1.addAction(sureAlertAction)
        alertController1.addAction(otherAlertAction)
        alertController1.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "用户名"//不同于UIAlertView，可以在闭包内设置TextField的样式属性
        }
        alertController1.addTextFieldWithConfigurationHandler { (passwardField) -> Void in
            passwardField.placeholder = "密码"
        }
        let button2:UIButton = UIButton(type: UIButtonType.Custom)
        button2.frame = CGRectMake(150, 500, 165, 30)
        button2.setTitle("UIAlertController", forState: .Normal)
        button2.backgroundColor = UIColor.redColor()
        button2.addTarget(self, action: #selector(openAlertController1), forControlEvents: .TouchUpInside)
        scrollView.addSubview(button2)
    }
    func openAlertController1(){
        self.presentViewController(alertController1, animated: true, completion: nil)
    }
    
    //MARK:UIActionSheet对象
    func initActionSheet(){
        actionSheet.title = "这是旧版本的UIActionSheet"
        actionSheet.delegate = self
        actionSheet.addButtonWithTitle("取消")
        actionSheet.addButtonWithTitle("确认")
        actionSheet.addButtonWithTitle("更多")
        let button3:UIButton = UIButton(type: UIButtonType.Custom)
        button3.frame = CGRectMake(5, 540, 140, 30)
        button3.setTitle("UIActionSheet", forState: .Normal)
        button3.backgroundColor = UIColor.redColor()
        button3.addTarget(self, action: #selector(openActionSheet), forControlEvents: .TouchUpInside)
        scrollView.addSubview(button3)
    }
    func openActionSheet(){
        actionSheet.showInView(self.view)//actionSheet的弹出方式，还有showFromToolbar,showFromBar,showFromRect等
    }
    //设置actionSheet的代理方法
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        print("点击了索引值为\(buttonIndex)的按钮")
    }
    
    //MARK:UIAlertController对象，用于ActionSheet时
    func initAlertController2(){
        alertController2.title = "这是新版本的UIAlertController"
        let cancelAlertAction:UIAlertAction = UIAlertAction(title: "取消", style: .Cancel) { (cancelButton) -> Void in
            print("点击了取消按钮")
        }
        let sureAlertAction:UIAlertAction = UIAlertAction(title: "确认", style: .Default) { (sureButton) -> Void in
            print("点击了确认按钮")
        }
        let otherAlertAction:UIAlertAction = UIAlertAction(title: "更多", style: .Destructive) { (otherButton) -> Void in
            print("点击了更多按钮")
        }
        alertController2.addAction(cancelAlertAction)
        alertController2.addAction(sureAlertAction)
        alertController2.addAction(otherAlertAction)
        let button4:UIButton = UIButton(type: UIButtonType.Custom)
        button4.frame = CGRectMake(150, 540, 165, 30)
        button4.setTitle("UIAlertController", forState: .Normal)
        button4.backgroundColor = UIColor.redColor()
        button4.addTarget(self, action: #selector(openAlertController2), forControlEvents: .TouchUpInside)
        scrollView.addSubview(button4)
    }
    func openAlertController2(){
        self.presentViewController(alertController2, animated: true, completion: nil)
    }
    
    //MARK:UITextView对象
    func initTextView(){
        let textView:UITextView = UITextView(frame: CGRectMake(20, 580, 280, 100))
        textView.backgroundColor = UIColor.grayColor()
        textView.font = UIFont.systemFontOfSize(20)
        textView.textAlignment = NSTextAlignment.Left
        textView.editable = true
        textView.text = "电话：15336565753\n您还可以接着输入字符"
        textView.dataDetectorTypes = .PhoneNumber//设置文字链接化，这里指定textView中含有电话链接，在editable属性为false时有效
        textView.delegate = self
        scrollView.addSubview(textView)
    }
    //设置textView的代理方法
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        print("replacementText: \(text)")//打印每次输入的文字
        return true
    }
    func textViewDidChange(textView: UITextView) {
        print("您目前已输入了以下内容: \n\(textView.text)")
    }
    func textViewDidEndEditing(textView: UITextView) {
        print("已经完成编辑，您输入了: \n\(textView.text)")
    }
    
    //MARK:UIPickerView对象
    func initPickerView(){
        let pickerView:UIPickerView = UIPickerView(frame: CGRectMake(20,690,200,200))
        pickerView.delegate = self
        pickerView.dataSource = self//设置数据源，需要遵循UIPickerViewDataSource协议
        pickerArray = ["one","two","three","four","five"]
        scrollView.addSubview(pickerView)
    }
    //设置pickerView的代理方法
    //设置分区数
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }
    //设置每个分区的行数
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerArray!.count
    }
    //设置分区的宽度
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    //设置每一行的高度
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    //设置每一行的内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray?[row]
    }
    //获取选中的内容
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("第\(component+1)分区，第\(row+1)行")
    }
    
    //MARK:UIDatePicker对象
    func initDataPicker(){
        let dataPicker:UIDatePicker = UIDatePicker(frame: CGRectMake(20,900,200,200))
        dataPicker.datePickerMode = .Time//设置显示模式
        dataPicker.addTarget(self, action: #selector(changeDate(_:)), forControlEvents: .ValueChanged)
        scrollView.addSubview(dataPicker)
    }
    func changeDate(dataPicker:UIDatePicker){
        print("\(dataPicker.date)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

