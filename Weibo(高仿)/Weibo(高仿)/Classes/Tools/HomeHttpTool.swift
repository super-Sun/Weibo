//
//  HomeHttpTool.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/14.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class HomeHttpTool: HttpTool {
    //获取用户信息(头像、)
    class func getUserInfo(urlStr:String?, params: AnyObject?, finished:(result: AnyObject?)->(), failure: (error: NSError)->()) {
        HomeHttpTool.manage.GET("2/users/show.json", parameters: params, success: { (task: NSURLSessionDataTask, objc:AnyObject?) -> Void in
            //
            finished(result: objc)
            }) { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error: error)
        }
    }
    //获取微博数据
    class func getStatus(urlStr:String?, params: AnyObject?, finished:(result: AnyObject?)->(), failure: (error: NSError)->()) {
        HomeHttpTool.manage.GET("2/statuses/home_timeline.json", parameters: params, success: { (task: NSURLSessionDataTask, objc:AnyObject?) -> Void in
            //
            finished(result: objc)
            }) { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                failure(error: error)
        }
    }

}
