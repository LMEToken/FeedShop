//
//  UserHeaderTableViewCell.swift
//  食铺
//
//  Created by weiping.tan on 16/6/29.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

import UIKit

class UserHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLable: UILabel!
    
    @IBOutlet weak var headImageVIew: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headImageVIew.layer.cornerRadius = CGFloat(50/2)
        
        self.headImageVIew.layer.masksToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
