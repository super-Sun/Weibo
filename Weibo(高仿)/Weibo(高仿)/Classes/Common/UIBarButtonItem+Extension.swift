//
//  File.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/11.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName: String, target:AnyObject?, action:Selector) {
        //
        let btn = UIButton.init(type: UIButtonType.Custom)
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btn.sizeToFit()
        self.init(customView:btn)
    }
}
