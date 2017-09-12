//
//  HHImageConfig.swift
//  HHIconHandle
//
//  Created by henry on 2017/8/29.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Foundation
import HandyJSON

class HHImageConfigInfo:HandyJSON {
    var version:Int! = 1
    var author:String! = "xcode"
    
    required init() {
        
    }
}

class HHImageConfig:HandyJSON{
    var images:[HHIconModel]? = nil
    var info:HHImageConfigInfo = HHImageConfigInfo()
    required init() {
        
    }
}
