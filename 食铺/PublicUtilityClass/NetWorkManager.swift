//
//  NetWorkManager.swift
//  食铺
//
//  Created by weiping.tan on 16/6/29.
//  Copyright © 2016年 SSaaS. All rights reserved.
//

import UIKit
import Alamofire

class NetWorkManager: NSObject {
    
  

    /**
     网络访问接口
     
     - parameter josnUrl:         访问url
     - parameter succuseCallBack: 成功的回调
     - parameter failCallBack:    失败的回调
     */
    static func request(josnUrl:String,succuseCallBack:(callBack:String)->Void,failCallBack:(callBack:String) ->Void) -> Void {
        
        Alamofire.request(.GET,josnUrl, parameters:nil)
            .validate()
            .responseJSON {
                response in switch response.result {
                    
                case .Success:
                    
                    print(response.result);
                    
                    succuseCallBack(callBack: "成功了哈哈")

                case .Failure(let error):
                    
                    failCallBack(callBack: "失败了卧槽")
                    
                    print(error)
                }
        }
    }
   
}
