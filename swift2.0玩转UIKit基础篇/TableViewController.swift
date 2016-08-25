//
//  TableViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/23.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let tableView:UITableView = UITableView(frame: CGRectMake(0, 0, 0, 0), style: .Grouped)
    var rightButton:UIBarButtonItem?
    var tableArray:Array<String>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "演示TableView"
        rightButton = UIBarButtonItem(title: "编辑", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(editTableView))
        self.navigationItem.rightBarButtonItem = rightButton
        
        tableView.frame = self.view.frame
        tableView.delegate = self
        tableView.dataSource = self//设置数据源，需要遵循UITableViewDataSource协议
        tableArray = ["1","2","3","4","5","6","7","8","9","10"]
        tableView.reloadData()
        self.view.addSubview(tableView)
    }
    //设置分区数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    //设置每个分区的行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableArray?.count)!
    }
    //设置头视图的高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    //设置头视图
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view:UIView = UIView(frame: CGRectMake(0,0,320,60))
        view.backgroundColor = UIColor.redColor()
        let label:UILabel = UILabel(frame: CGRectMake(0,0,320,60))
        label.text = "区块\(section+1)"//若纯粹只是设置标题，则不必使用viewForHeaderInSection，选用titleForHeaderInSection即可
        view.addSubview(label)
        return view
    }
    //设置尾视图的高度
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 60
    }
    //设置尾视图
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view:UIView = UIView(frame: CGRectMake(0,0,320,60))
        view.backgroundColor = UIColor.blueColor()
        return view
    }
    //设置行的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 40
    }
    //设置cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //cell的复用
        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cellid")
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellid")
            cell?.selectionStyle = .Blue//设置cell被点击时的样式
        }
        cell?.textLabel?.text = tableArray?[indexPath.row]
        return cell!
    }
    //获取选中的内容
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("选中：第\(indexPath.section+1)分区，第\(indexPath.row+1)行")
    }
    //获取取消选中的内容
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        print("取消选中：第\(indexPath.section+1)分区，第\(indexPath.row+1)行")
    }
    //设置具体的编辑状态
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.Delete
    }
    //设置编辑状态对应的具体逻辑操作
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            tableArray?.removeAtIndex(indexPath.row)
        }else if editingStyle == UITableViewCellEditingStyle.Insert{
            tableArray?.append("new")
        }
        tableView.reloadData()
    }
    //设置tableView的移动
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let str = tableArray?[sourceIndexPath.row]
        tableArray?.removeAtIndex(sourceIndexPath.row)
        tableArray?.insert(str!, atIndex: destinationIndexPath.row)
    }
    
    func editTableView(){
        tableView.setEditing(!tableView.editing, animated: true)
        rightButton?.title = tableView.editing ? "完成" : "编辑"
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
