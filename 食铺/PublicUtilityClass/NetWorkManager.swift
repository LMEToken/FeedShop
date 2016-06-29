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
    
    
    func request() -> Void {
        
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["foo": "bar"])
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
    }
   
}
