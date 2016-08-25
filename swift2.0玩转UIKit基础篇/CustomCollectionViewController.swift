//
//  CustomCollectionViewController.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/23.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class CustomCollectionViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    var array:Array<String> = Array()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "演示自定义CollectionView"
        initArray()
        
        let myLayout = MyLayout()//使用自定义的UICollectionViewFlowLayout类
        myLayout.itemCount = array.count
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: myLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerClass(MyCell.self, forCellWithReuseIdentifier: "cellid")
        self.view.addSubview(collectionView)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellid", forIndexPath: indexPath) as! MyCell
        cell.backgroundColor = UIColor(red: (CGFloat)(random()%255)/255, green: (CGFloat)(random()%255)/255, blue: (CGFloat)(random()%255)/255, alpha: 1)
        cell.titleTextView!.text = array[indexPath.row]
        return cell
    }
    
    func initArray(){
        for i in 1...100{
            array.append("\(i)")
        }
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
