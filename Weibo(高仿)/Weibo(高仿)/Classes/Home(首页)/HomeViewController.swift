//
//  HomeViewController.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/7.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
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
