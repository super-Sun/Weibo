//
//  HomeViewController.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/7.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    //全局微博数据
    var statusArray: [Status]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var islogin = false
    //在控制器 加载view之前，判断是否已经登入
    override func loadView() {
        //
        islogin = Account.getInstance()?.access_token != nil
        
        if !islogin {
//             let frame = CGRectMake(0, 0, 320, 0)
            let view1 = UIView.init()
            view1.backgroundColor = UIColor.redColor()
            
            let bt = UIButton(frame: CGRectMake(100, 100, 100, 100))
            bt.setTitle("login", forState: UIControlState.Normal)
            bt.backgroundColor = UIColor.blueColor()
            bt.addTarget(self, action: Selector("loginClike"), forControlEvents: UIControlEvents.TouchUpInside)
            view1.addSubview(bt)
            
            view = view1
        } else {
            super.loadView()
            //获取微博数据
            guard let access_token = Account.getInstance()?.access_token else{
                return
            }
            let params = ["access_token" : access_token]
            
            HomeHttpTool.getStatus("", params: params, finished: { (result) -> () in
                //获取结果集合
                let dict = result as! [String: AnyObject]
                let dictArray = dict["statuses"] as! [[String: AnyObject]]
                var modelArray = [Status]()
                
                for dic in dictArray {
                    let status = Status(dict: dic)
                    modelArray.append(status)
                }
                self.statusArray = modelArray
                print(modelArray)
                }, failure: { (error) -> () in
                    //
            })
        }
    }
    func loginClike() {
        let sb = UIStoryboard(name: "Author", bundle: nil)
        let vc = sb.instantiateInitialViewController()!
        presentViewController(vc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
//
        //设置导航栏样式
        //1.添加导航栏的左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: Selector("BtLeftClike"))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: Selector("BtRightClike"))
        //2.添加标题
        //
        let titleBt = NavTitleButton()
        titleBt.setTitle(Account.getInstance()?.screen_name, forState: UIControlState.Normal)
        navigationItem.titleView = titleBt
    }
    @objc func BtLeftClike() {
        print("BtLeftClike")
    }
    @objc func BtRightClike() {
        print("BtRightClike")
    }
    
}

extension HomeViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusArray?.count ?? 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? HomeTableViewCell
        if cell == nil {
            cell = HomeTableViewCell()
        }
        cell!.statusModel = statusArray![indexPath.row]
        return cell!
    }
    
}
