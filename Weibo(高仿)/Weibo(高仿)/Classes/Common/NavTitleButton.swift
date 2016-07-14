//
//  NavTitleButton.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/12.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class NavTitleButton: UIButton {
    
    var btnSelected = false
    
    //按你点击事件
    func btClike() {
        btnSelected = !btnSelected
        selected = btnSelected
    }
    override func setTitle(title: String?, forState state: UIControlState) {
        //
        super.setTitle((title ?? "") + "  ", forState: state)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        addTarget(self, action: Selector("btClike"), forControlEvents: UIControlEvents.TouchUpInside)
        sizeToFit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel?.frame.origin.x = 0.0
        imageView?.frame.origin.x = (titleLabel?.frame.size.width)!
    }

}
