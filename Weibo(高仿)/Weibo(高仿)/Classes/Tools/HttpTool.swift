//
//  HttpTool.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/13.
//  Copyright © 2016年 hador. All rights reserved.
//
import UIKit
import AFNetworking

class HttpTool: NSObject {
    typealias SUCCESS = ((task: NSURLSessionDataTask, objc: AnyObject?)->Void)?
    typealias FAILURE = ((task: NSURLSessionDataTask?, error: NSError)->Void)?
    
    static let manage = AFHTTPSessionManager(baseURL: NSURL(string:"https://api.weibo.com/"))
    /**
     为返回结果扩充 content/type
     */
    class func addType(){
        
        let types:Set<String> = ["application/json", "text/json", "text/javascript", "text/plain"]
        
        HttpTool.manage.responseSerializer.acceptableContentTypes = types
        
    }
    

}
