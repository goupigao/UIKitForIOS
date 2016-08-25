//
//  MyLayout.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/23.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class MyLayout: UICollectionViewFlowLayout {
    var itemCount:Int?
    var attributeArray:Array<UICollectionViewLayoutAttributes>?
    override func prepareLayout() {
        super.prepareLayout()
        attributeArray = Array()
        let width = (UIScreen.mainScreen().bounds.size.width - self.minimumInteritemSpacing)/2
        var leftHeight = 0;
        var rightHeight = 0;
        for i in 0..<itemCount!{
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            let attribute = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            let height = random()%140+50
            var col = 0
            //哪列矮，就将元素放在哪列
            if leftHeight<=rightHeight {
                leftHeight = leftHeight + height + (Int)(self.minimumLineSpacing)
                col = 0
            }else{
                rightHeight = rightHeight + height + (Int)(self.minimumLineSpacing)
                col = 1
            }
            attribute.frame = CGRectMake((CGFloat)(col)*(width+self.minimumInteritemSpacing), (CGFloat)((col==0 ? leftHeight : rightHeight)-height), width, (CGFloat)(height))
            attributeArray?.append(attribute)
        }
        if leftHeight<=rightHeight {
            self.itemSize = CGSizeMake(width, (CGFloat)(rightHeight * 2 / itemCount!)-self.minimumLineSpacing)
        }else{
            self.itemSize = CGSizeMake(width, (CGFloat)(leftHeight * 2 / itemCount!)-self.minimumLineSpacing)
        }
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributeArray
    }
}
