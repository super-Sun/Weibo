//
//  Status.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/14.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class Status: NSObject {
    /// 微博创建时间
    var created_at: String?
    
    /// 字符串型的微博ID
    var idstr: String?
    
    /// 微博信息内容
    var text: String?
    
    /// 微博来源
    var source: String?
    //
    var user: User?
    
    init(dict: [String: AnyObject])
    {
        super.init()
        setValuesForKeysWithDictionary(dict)
    }
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    override func setValue(value: AnyObject?, forKey key: String) {
        
        if key == "user" {
            user = User(dict: value as! [String: AnyObject])
            //小心循环引用
//            setValue(dict, forKey: key)
            return
        }
        super.setValue(value, forKey: key)
    }
    
    override var description: String {
        let property = ["created_at", "idstr", "text", "source"]
        let dict = dictionaryWithValuesForKeys(property)
        return "\(dict)"
    }
    
}