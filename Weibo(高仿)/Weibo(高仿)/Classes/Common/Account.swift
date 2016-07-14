//
//  Account.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/13.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

/// UserDefaults中保存到key
let USERDEF_KEY = "wb_account"

class Account: NSObject {
    
    
    
 /// token
    var access_token: String?
 /// token失效时间
    var expires_in: Int = 0
    var remind_in: String?
    var uid: String?
    
    ///  用户头像地址（大图），180×180像素
    var avatar_large: String?{
        set{
            let userDef = NSUserDefaults.standardUserDefaults()
            userDef.setObject(newValue, forKey: "avatar_large")
            userDef.synchronize()
        }
        get{
            let userDef = NSUserDefaults.standardUserDefaults()
            guard let avatar_large = userDef.valueForKey("avatar_large") as? String else {
                return nil
            }
            return avatar_large
        }
    }
    
    /// 用户昵称
    var screen_name: String? {
        set{
            let userDef = NSUserDefaults.standardUserDefaults()
            userDef.setObject(newValue, forKey: "screen_name")
            userDef.synchronize()
        }
        get{
            let userDef = NSUserDefaults.standardUserDefaults()
            guard let screen_name = userDef.valueForKey("screen_name") as? String else {
                return nil
            }
            return screen_name
        }
    }
    
    override init(){
        super.init()
        
        let userDef = NSUserDefaults.standardUserDefaults()
    
        guard let dict = userDef.valueForKey(USERDEF_KEY) as? [String: AnyObject] else {
            return
        }
        setValuesForKeysWithDictionary(dict)

    }
    class func getInstance() -> Account? {
        
        let userDef = NSUserDefaults.standardUserDefaults()
        guard let dict = userDef.valueForKey(USERDEF_KEY) as? [String: AnyObject] else {
            return nil
        }
        return Account(dict: dict)
    }
    /**
     通过字典创建Account
     
     - parameter dict: 字典
     
     - returns: Account对象
     */
    init(dict:[String : AnyObject]) {
        super.init()
        // 1.设置键值
        setValuesForKeysWithDictionary(dict)
        // 2.保存到UserDefaults
        let userDef = NSUserDefaults.standardUserDefaults()
        
        if userDef.valueForKey(USERDEF_KEY) != nil {
            userDef.removeObjectForKey(USERDEF_KEY)
        }
        userDef.setObject(dict, forKey: USERDEF_KEY)
        userDef.synchronize()
        
    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        //
        print(key)
        print("-->Undefined")
    }
    /**
     保存到userDefaults
     */
    
//    func saveAccount(dict:[String: AnyObject]) -> Bool{
//        
//        let userDef = NSUserDefaults.standardUserDefaults()
//        
//        return false
//    }
    
    /**
     获取Account对象
     
     - returns: Account
     */
    /*
    func getAccount() -> Account {
        let userDef = NSUserDefaults.standardUserDefaults()
        access_token = userDef.valueForKey("access_token") as? String
        expires_in = userDef.valueForKey("expires_in") as! Int
        remind_in = userDef.valueForKey("remind_in") as? String
        uid = userDef.valueForKey("uid") as? String
        
        return self
    }
    */
    /*
    /**
     归档
     - parameter aCoder: <#aCoder description#>
     */
    func encodeWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(access_token, forKey: "access_token")
        aCoder.encodeInteger(expires_in, forKey: "expires_in")
        aCoder.encodeObject(remind_in, forKey: "remind_in")
        aCoder.encodeObject(uid, forKey: "uid")
    }
    /**
     解档
     - parameter aCoder: <#aCoder description#>
     */
    required init?(coder aDecoder: NSCoder) {

        aDecoder.decodeObjectForKey("access_token")
        aDecoder.decodeIntegerForKey("expires_in")
        aDecoder.decodeObjectForKey("remind_in")
        aDecoder.decodeObjectForKey("uid")
        
    }
    */

}
