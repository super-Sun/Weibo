//
//  HomeTableViewCell.swift
//  Weibo(高仿)
//
//  Created by sunluwei on 16/7/14.
//  Copyright © 2016年 hador. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var vipImageView: UIImageView!
    
    @IBOutlet weak var timeLbl: UILabel!
    
    @IBOutlet weak var deviceLbl: UILabel!
    
    @IBOutlet weak var contentLbl: UILabel!
    
    var statusModel: Status? {
        didSet {
            guard let status = statusModel else {
                return
            }
            /*
            /// 字符串型的用户UID
            var idstr: String?
            
            /// 用户昵称
            var screen_name: String?
            
            /// 用户头像地址（中图），50×50像素
            var profile_image_url: String?
            */
            guard let user = status.user else{
                return
            }
            iconImageView.sd_setImageWithURL(NSURL(string: (user.profile_image_url)!))
            nameLbl.text = user.screen_name
//            timeLbl.text = status.created_at
            timeLbl.text = "刚刚"
            /*
            <a href="http://weibo.com/" rel="nofollow">微博 weibo.com</a>
            
            <a href="http://app.weibo.com/t/feed/8crQy" rel="nofollow">Weico.iPhone</a>
            
            <a href="http://app.weibo.com/t/feed/1tqBja" rel="nofollow">360安全浏览器</a>
            
            <a href="http://app.weibo.com/t/feed/2y7Irr" rel="nofollow">UC浏览器Android版</a>
            */
            
            let startIndex = status.source!.rangeOfString(">")!.endIndex
            let endIndex = status.source!.rangeOfString("</a>")!.startIndex
            let range:Range = Range.init(start: startIndex, end: endIndex)
            
            deviceLbl.text = status.source?.substringWithRange(range)
            contentLbl.text = status.text
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let margin: CGFloat = 10
        //
        contentLbl.preferredMaxLayoutWidth = UIScreen.mainScreen().bounds.size.width - 2 * margin
        iconImageView.layer.cornerRadius = 20
    }

    

}
