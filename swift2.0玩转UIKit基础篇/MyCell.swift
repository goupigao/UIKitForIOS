//
//  MyCell.swift
//  swift2.0玩转UIKit基础篇
//
//  Created by goupigao on 16/8/23.
//  Copyright © 2016年 goupigao. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    var titleTextView:UITextView?//title
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        titleTextView = UITextView(frame: CGRectMake(5, 5, 40, 40))
        titleTextView?.backgroundColor = UIColor.clearColor()
        self.addSubview(titleTextView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
