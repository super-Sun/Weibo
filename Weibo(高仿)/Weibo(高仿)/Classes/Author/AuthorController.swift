//
//  ViewController.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/13.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class AuthorController: UIViewController {
    //js脚本
    @IBAction func AutoWrite(sender: AnyObject) {
        let jsStr = "document.getElementById('userId').value='***';document.getElementById('passwd').value='***'"
        webView.stringByEvaluatingJavaScriptFromString(jsStr)
    }
    @IBOutlet weak var webView: UIWebView!
    //请求配置参数
    //client_id
    let WB_APP_KEY = "3174889461"
    let WB_APP_SECRET = "26f31d4b63b5e5cf1988004fa348cd83"
    //redirect_uri
    let WB_APP_REDIRE = "http://www.baidu.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //请求地址
        let urlStr = "https://api.weibo.com/oauth2/authorize?client_id=" + WB_APP_KEY + "&redirect_uri=" + WB_APP_REDIRE
        let url = NSURL(string: urlStr)!
        //设置请求
        let request = NSURLRequest(URL: url)
        let jsStr = "document.getelementbyid('userId').value=18380463037"
        webView.stringByEvaluatingJavaScriptFromString(jsStr)
        
        webView.loadRequest(request)
    }
    func getToken(code: String) {
        /**
        *  添加请求支持类型,"application/json", "text/json", "text/javascript", "text/plain"
        */
        HttpTool.addType()
        /// token请求地址
        let URLString = "oauth2/access_token"
        /// token请求参数
        let params = [
            "client_id" : WB_APP_KEY,
            "client_secret" : WB_APP_SECRET,
            "grant_type " : "authorization_code",
            "code" : code,
            "redirect_uri" : WB_APP_REDIRE
            ]
        /**
        *  发起post请求
        */
        HttpTool.manage.POST(URLString, parameters: params, success: { (task: NSURLSessionDataTask, objc: AnyObject?) -> Void in
            //objc
            _ = Account.init(dict: objc as! [String:AnyObject])
            
            print(Account.getInstance()?.access_token)
            //去除modal的窗口
            self.dismissViewControllerAnimated(true, completion: nil)
            //切换主窗口 为 首页
            UIApplication.sharedApplication().keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController();
            //
            }) { (task: NSURLSessionDataTask?, error: NSError?) -> Void in
                //
            print(error)
        }
        
    }
}

extension AuthorController: UIWebViewDelegate {
    //webView 发起请求 都会来到这个方法
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        let url = request.URL!.absoluteString
        print(url)
        /*首先会到登入界面
         *授权界面
         *点击授权 会返回回调地址和code
        */
        if url.hasPrefix(WB_APP_REDIRE + "/?code=") {
            let urlParam = request.URL!.query
            let code = urlParam?.substringFromIndex("code=".endIndex)
            /**
            *  通过code请求token
            */
            getToken(code!)

            return false
        }
        
        return true
    }
    
    
}
