//
//  FirstViewController.swift
//  食铺
//
//  Created by weiping.tan on 16/6/28.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

import UIKit

class FirstViewController: BaseMainViewController,UITableViewDelegate,UITableViewDataSource {

    
    let titles = ["川菜","鲁菜","粤菜","苏菜","浙菜","闽菜","湘菜","徽菜"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.addSubview(initUITableView())

        [self .setTitleName("食铺")]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func initUITableView() -> UITableView {
        
        let tableView = UITableView(frame: CGRectZero)
        
        tableView.frame = CGRectMake(0, getHeaderViewHeight(), self.view.frame.size.width, self.view.frame.size.height-getHeaderViewHeight()-49);
        
        tableView.delegate = self;
        
        tableView.dataSource = self;
        
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        
        tableView.tableFooterView = UIView()
        
        return tableView;
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return titles.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell;

        cell.textLabel?.text = titles[indexPath.row]
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        return cell;
    }
   
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

