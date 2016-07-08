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
        addViewController(HomeViewController(),title: "首页",image: "tabbar_home",selectImage: "tabbar_home_highlighted")
        addViewController(MessageController(),title: "消息",image: "tabbar_message_center",selectImage: "tabbar_message_center_highlighted")
        addViewController(UIViewController(),title: "",image: "",selectImage: "")
        addViewController(DiscoveryController(),title: "发现",image: "tabbar_discover",selectImage: "tabbar_discover_highlighted")
        addViewController(MeViewController(),title: "我",image: "tabbar_profile",selectImage: "tabbar_profile_highlighted")
        
        //添加＋号按钮:不在viewDidLoad执行，原因是 在这里其它item没有被创建，“加号按钮”会在最底部，在其顶部会覆盖一个Item，导致无法获取 “加号按钮”的点击事件，因此需要在viewWillAppear方法内执行，保证能够“加号按钮”获取的点击事件
//        addIcon()
        
    }
    private func addIcon() {
        let addBtn = UIButton()
        //添加图片
        addBtn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: UIControlState.Normal)
        addBtn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"),forState: UIControlState.Highlighted)
        addBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: UIControlState.Normal)
        addBtn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: UIControlState.Highlighted)
        addBtn.addTarget(self, action: "addClike", forControlEvents: UIControlEvents.TouchUpInside)
        let count:Int = (viewControllers?.count)!
        let screen:CGFloat = UIScreen.mainScreen().bounds.size.width
        //设置frame
        let iconW = screen/CGFloat(count)
        addBtn.frame = CGRect(x: iconW * 2.0, y: 0, width: iconW, height: 49)
        tabBar.addSubview(addBtn)
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //添加＋号按钮
        addIcon()
    }
    /**
     点击事件在swift里面不能用私有private修饰
     */
    func addClike() {
        print("00000")
        presentViewController(UIViewController(), animated: true) { () -> Void in
        }
    }
    
    /**
     添加控制器到tabbarController
     
     - parameter vc:          控制器
     - parameter title:       标题
     - parameter image:       图片
     - parameter selectImage: 点击后到图片
     */
    private func addViewController(vc: UIViewController,title: String, image:String, selectImage: String) {
        tabBar.tintColor = UIColor.orangeColor()
        //设置image、title
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selectImage)
        //创建导航控制器
        let nav =  MainNavController(rootViewController: vc)
        
        addChildViewController(nav)

    }
    
//    override  func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
//        
//        print(item.title)
//    }
    
}
