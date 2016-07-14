//
//  WelcomeController.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/13.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var iconBottomMargin: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        iconImageView.layer.cornerRadius = 34
        titleLabel.alpha = 0.0
        guard let account = Account.getInstance() else {
            return
        }
        if account.avatar_large != nil {
            iconImageView.sd_setImageWithURL(NSURL(string: account.avatar_large!))
            
        }else {
            
            let access_token = Account.getInstance()!.access_token!
            let uid = Account.getInstance()!.uid!
            let params = ["access_token": access_token, "uid": uid]
            
            HomeHttpTool.getUserInfo("", params: params, finished: { (result) -> () in
                //
                let dict = result as? [String: AnyObject]
                account.avatar_large = dict!["avatar_large"] as? String
                account.screen_name = dict!["screen_name"] as? String
                print(result)
                self.iconImageView.sd_setImageWithURL(NSURL(string: account.avatar_large!))
                
                }) { (error) -> () in
                    //
                    print(error)
            }
        }
            
    }
        
    func doAnimation() {
        iconBottomMargin.constant = UIScreen.mainScreen().bounds.size.height - iconBottomMargin.constant
        UIView.animateWithDuration(2.0, animations: { () -> Void in
            //更新UI,执行图标动画
            self.view.layoutIfNeeded()
            }) { (Bool) -> Void in
                //
                //执行标题动画
                UIView.animateWithDuration(1.0, animations: { () -> Void in
                    //执行标题动画
                    self.titleLabel.alpha = 1.0
                    }, completion: { (Bool) -> Void in
                        //跳转到首页
                        let sb = UIStoryboard(name: "Main", bundle: nil)
                        let vc = sb.instantiateInitialViewController()
                        UIApplication.sharedApplication().keyWindow?.rootViewController = vc
                })
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //做动画
        self.doAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
