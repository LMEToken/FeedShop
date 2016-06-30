//
//  SecondViewController.swift
//  食铺
//
//  Created by weiping.tan on 16/6/28.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

import UIKit

class SecondViewController: BaseMainViewController,UITableViewDataSource,UITableViewDelegate{

    
    let myList = ["","收藏","我的菜谱","我的视频","关于我们","退出登陆"];
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        [self.setTitleName("我的")]
        
        self.view.addSubview(initTableView())
//        
//        NetWorkManager.request("http://apis.juhe.cn/idcard/index?key=98cb940ac452822dbd3e83895dec2a8d&cardno=430223199505097618",
//                        callBack: {(callBacll) -> Void in
//                            print(callBacll)
//                        }
//            
//        )
        
        let  url = "http://apis.juhe.cn/idcard/index?key=98cb940ac452822dbd3e83895dec2a8d&cardno=430223199505097618"
        
            NetWorkManager.request(url, succuseCallBack: { (callBack) in
              //成功后的回调
                print(callBack)
            
            }){(callBack) in
                
               // 失败后的回调
                print(callBack)
                
            }
    
        // Do any additional setup after loading the view, typically from a nib.
    }
    
 

    func initTableView() -> UITableView {
        
        let tableView = UITableView(frame: CGRectZero)
        
        tableView.frame = CGRectMake(0, getHeaderViewHeight(), self.view.frame.size.width, self.view.frame.size.height-getHeaderViewHeight()-49);
        
        tableView.delegate = self
        
        tableView.dataSource = self
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")

        tableView.tableFooterView = UIView()
        

        // Nib 注册
        tableView.registerNib(UINib(nibName: "UserHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "UserHeaderTableViewCell")


        return tableView;
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if (myList[indexPath.row] == "") {
            
            return 80;
        }
        return 45;
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return myList.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
       if (myList[indexPath.row] == "")
       {
            let cell = tableView.dequeueReusableCellWithIdentifier("UserHeaderTableViewCell") as! UserHeaderTableViewCell
        
            cell.nameLable.text = "伟平"
        
            cell.headImageVIew.image = UIImage.init(named: "headImage")
        
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
            return cell

       }else
       {
        
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
            
            cell.textLabel?.text = myList[indexPath.row]
            
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            
            return cell
        
       }
     
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

