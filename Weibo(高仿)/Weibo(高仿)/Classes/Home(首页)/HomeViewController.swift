//
//  HomeViewController.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/7.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var islogin = true
    //在控制器 加载view之前，判断是否已经登入
    override func loadView() {
        //
        if !islogin {
//             let frame = CGRectMake(0, 0, 320, 0)
            let view1 = UIView.init()
            view1.backgroundColor = UIColor.redColor()
            view = view1
        } else {
            super.loadView()
        }
    }
    
    override func viewDidLoad() {
        //设置导航栏样式
        //1.添加导航栏的左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: Selector("BtLeftClike"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: Selector("BtRightClike"))
        //2.添加标题
        //
        navigationItem.titleView = NavTitleButton()
    }
    @objc func BtLeftClike() {
        print("BtLeftClike")
    }
    @objc func BtRightClike() {
        print("BtRightClike")
    }
    
}
