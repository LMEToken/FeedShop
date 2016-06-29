//
//  BaseMainViewController.swift
//  食铺
//
//  Created by weiping.tan on 16/6/28.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

import UIKit

class BaseMainViewController: UIViewController
{
 
    var headView = UIView();
    
    
    override func viewDidLoad()
    {
        headView = initHeadViewUI()
        
        self.view.addSubview(headView);
    }

    /**
     获取头部视图高度
     - returns: 头部视图高度
     */
    func getHeaderViewHeight() -> CGFloat {
        
        let height = UIApplication.sharedApplication().statusBarFrame.size.height + (self.tabBarController?.tabBar.frame.size.height)!
        return height;
    }

    /**
     初始化头部视图
     - returns: 头部视图
     */
    func initHeadViewUI() ->UIView{

        let headView = UIView()

        headView.frame = CGRectMake(0, 0, view.frame.width,getHeaderViewHeight())
        
        headView.backgroundColor = UIColor.grayColor()
        
        return headView
    }
    /**
     设置标题名称
     - parameter title: 标题名称
     */
    func setTitleName(title : NSString) -> Void {
        
        let titleLable = UILabel()
        
        titleLable.frame = CGRectMake(100,getHeaderViewHeight()-40 , self.view.frame.width - 200, 40)
        
        titleLable.textColor = UIColor.whiteColor()
        
        titleLable.textAlignment = NSTextAlignment.Center
        
        titleLable.text = title as String
        
        headView.addSubview(titleLable)
        
    }
    /**
     设置右侧item及其点击事件
     
     - parameter seleter: 
     */
    func addrightItem(seleter:Selector) -> Void {
        
        let rightItem = UIButton()
        
        rightItem.frame = CGRectMake(self.view.frame.size.width-40, getHeaderViewHeight()-40, 30, 30)
        
        rightItem.backgroundColor = UIColor.whiteColor()
        
        rightItem .addTarget(self, action: seleter, forControlEvents:UIControlEvents.TouchUpInside)
        
        headView.addSubview(rightItem)
        
    }

}
