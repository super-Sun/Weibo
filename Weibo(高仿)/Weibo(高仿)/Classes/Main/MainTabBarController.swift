//
//  MainTabBarController.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/7.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        //添加字控制器
        addViewController(HomeViewController(),title: "title1",image: "",selectImage: "")
        addViewController(MessageController(),title: "title2",image: "",selectImage: "")
        addViewController(DiscoveryController(),title: "title3",image: "",selectImage: "")
        addViewController(MeViewController(),title: "title4",image: "",selectImage: "")
        //自定义tabbar
        
        
        
    }
    /**
     添加控制器到tabbarController
     
     - parameter vc:          控制器
     - parameter title:       标题
     - parameter image:       图片
     - parameter selectImage: 点击后到图片
     */
    private func addViewController(vc: UIViewController,title: String, image:String, selectImage: String) {
        
        //设置image、title
        vc.title = title
        tabBarItem.image = UIImage(named: image)
        tabBarItem.selectedImage = UIImage(named: selectImage)
        //创建导航控制器
        let nav =  MainNavController(rootViewController: vc)
        
        addChildViewController(nav)

    }
    
    override  func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        print(item.title)
    }
    
}
