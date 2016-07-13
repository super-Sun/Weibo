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
        
        addViewControllers()
        /*
        addViewController("HomeViewController",title: "首页",image: "tabbar_home",selectImage: "tabbar_home_highlighted")
        
        addViewController("MessageController",title: "消息",image: "tabbar_message_center",selectImage: "tabbar_message_center_highlighted")
        addViewController("NullController",title: "",image: "",selectImage: "")
        addViewController("DiscoveryController",title: "发现",image: "tabbar_discover",selectImage: "tabbar_discover_highlighted")
        addViewController("MeViewController",title: "我",image: "tabbar_profile",selectImage: "tabbar_profile_highlighted")
        */
        
        
        //添加＋号按钮:不在viewDidLoad执行，原因是 在这里其它item没有被创建，“加号按钮”会在最底部，在其顶部会覆盖一个Item，导致无法获取 “加号按钮”的点击事件，因此需要在viewWillAppear方法内执行，保证能够“加号按钮”获取的点击事件
//        addIcon()
        
    }
    private func addViewController(storyboardName: String) {
        let sb = UIStoryboard(name: storyboardName, bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        addChildViewController(vc)
        
    }
    private func addViewControllers() {
        
        addViewController("Home")
        addViewController("Message")
        addViewController("Null")
        addViewController("Discovery")
        addViewController("Me")
        
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
        let vc = UIViewController.init()
        
        vc.view.frame = view.bounds
        let bt = UIButton(frame: CGRectMake(0, 20, 100, 20))
        bt.setTitle("关闭", forState: UIControlState.Normal)
        bt.backgroundColor = UIColor.redColor()
        bt.addTarget(self, action: Selector("backClike"), forControlEvents: UIControlEvents.TouchUpInside)
        
        vc.view.addSubview(bt)
        presentViewController(vc, animated: true) { () -> Void in
        }
        
    }
    func backClike() {
        dismissViewControllerAnimated(true) { () -> Void in
            //
        }
    }
    
    /**
     添加控制器到tabbarController
     
     - parameter vc:          控制器
     - parameter title:       标题
     - parameter image:       图片
     - parameter selectImage: 点击后到图片
     */
    private func addViewController(controllerName: String,title: String, image:String, selectImage: String) {
        tabBar.tintColor = UIColor.orangeColor()
        //根据class string 创建类
        let productName = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as!String
        let name = controllerName
        let className = productName + "." + name;
        
        print("-----")
        /// 通过类名创建控制器
        let classType = NSClassFromString(className)! as! UIViewController.Type
        let vc = classType.init()
        // 通过storyboard创建
//        let sv = UIStoryboard.init(name: <#T##String#>, bundle: <#T##NSBundle?#>)
        //设置image、title
        vc.title = title
        vc.tabBarItem.image = UIImage(named: image)
        vc.tabBarItem.selectedImage = UIImage(named: selectImage)
        //创建导航控制器
        let nav =  MainNavController(rootViewController: vc)
        print(vc)
        
        addChildViewController(nav)
    }
    
    
}
