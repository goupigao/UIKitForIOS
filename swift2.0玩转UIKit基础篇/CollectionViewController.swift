//
//  CollectionViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/23.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    //UICollectionViewDelegateFlowLayout继承自UICollectionViewDelegate，因此这里不用再显式遵循UICollectionViewDelegate协议
    var collectionView:UICollectionView?
    var array:Array<String> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "演示CollectionView"
        initArray()
        let rightButton:UIBarButtonItem = UIBarButtonItem(title: "更换数据", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(changeData))
        self.navigationItem.rightBarButtonItem = rightButton
        
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Vertical//设置布局的方向
        layout.itemSize = CGSizeMake(80, 80)//设置每个元素的大小
        layout.minimumLineSpacing = 30//设置最小行间距
        layout.minimumInteritemSpacing = 30//设置最小元素间距
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.delegate = self
        collectionView!.dataSource = self
        collectionView!.registerClass(MyCell.self, forCellWithReuseIdentifier: "cellid")//注册cell
        self.view.addSubview(collectionView!)
    }
    //设置分区数
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    //设置每个分区的元素数量
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    //重写每个元素的大小
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let tmp = indexPath.row%3
        if tmp==0{
            return CGSizeMake(50, 50)
        }else if tmp==1{
            return CGSizeMake(100, 100)
        }else{
            return CGSizeMake(50, 50)
        }
    }
    //设置cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath) as! MyCell
        cell.backgroundColor = UIColor.redColor()
        cell.titleTextView!.text = array[indexPath.row]
        return cell
    }
    
    func changeData(){
        initArray()
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initArray(){
        array.removeAll()
        let itemCount = 50+random()%50
        for i in 1...itemCount{
            array.append("\(i)行\n\(random()%100)")
        }
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
