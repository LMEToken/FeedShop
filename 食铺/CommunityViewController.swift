//
//  CommunityViewController.swift
//  食铺
//
//  Created by weiping.tan on 16/6/28.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

import UIKit

class CommunityViewController: BaseMainViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate{
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //一行总数
    let rowCount = 3;
    
    //课程名称和图片，每一门课程用字典来表示
    let courses = [
        ["name":"川菜大师正在直播","pic":"swift.png"],
        ["name":"湘菜大师正在直播","pic":"oc.jpg"],
        ["name":"粤菜大师正在直播","pic":"java.png"],
        ["name":"浙菜大师正在直播","pic":"java.png"]
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setTitleName("社区")
        
        self.collectionView.backgroundColor = UIColor.clearColor();
        
        self.collectionView.registerClass(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.Add, target: self, action:#selector(CommunityViewController.addButtonClick))
        
        self.addrightItem(#selector(CommunityViewController.addButtonClick))
        
    }
    
    func addButtonClick() -> Void {
        
        NSLog("55555")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //UICollectionViewDateSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        
        return  11;
    }
    
    // CollectionView行数
    func collectionView(collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
   
        return  rowCount
    }
    
    //UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let  cell:UICollectionViewCell  = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        cell.backgroundColor = UIColor.darkGrayColor()
   
        for subview in cell.subviews {
            subview.removeFromSuperview()
        }
        // 添加图片
        let img = UIImageView(image: UIImage(named: courses[indexPath.item]["pic"]!))
        img.frame = cell.bounds
        img.contentMode = .ScaleAspectFit
        // 图片上面显示课程名称，居中显示
        let lbl = UILabel(frame:CGRectMake(0,5,cell.bounds.size.width,20))
        lbl.textAlignment = NSTextAlignment.Center
        lbl.text = courses[indexPath.item]["name"]
        lbl.font = UIFont.boldSystemFontOfSize(10)
        lbl.textColor = UIColor.whiteColor()
        cell.addSubview(img)
        cell.addSubview(lbl)
        return cell;
        
    }
//    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        

        return CGSizeMake(self.view.frame.width/CGFloat(rowCount)-20,self.view.frame.width/CGFloat(rowCount)-20)
        
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
//
    //UICollectionViewDelegate
    
    //UICollectionView被选中时调用的方法
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    //当前cell 可否被选择
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        
        return true;
    }
  
    
    

}
