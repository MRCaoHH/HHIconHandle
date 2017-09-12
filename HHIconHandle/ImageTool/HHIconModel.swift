//
//  HHIconModel.swift
//  HHIconHandle
//
//  Created by henry on 2017/8/28.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Foundation
import HandyJSON

enum HHIconScale:String,HandyJSONEnum {
    case oneScale = "1x"
    case towScale = "2x"
    case threeScale = "3x"
}

class HHIconModel : HandyJSON{
    var scale:HHIconScale! = .towScale
    var idiom:String! = "universal"
    var size:String! = "20x20"
    var filename:String! = ""
    
    var height:Float!{
        get{
            let sizeArr:[String] = self.size.components(separatedBy: "x")
            if sizeArr.count == 2 {
                return Float(sizeArr[1])
            }
            return 0.0
        }
    }
    
    var width:Float!{
        get{
            let sizeArr:[String] = self.size.components(separatedBy: "x")
            if sizeArr.count == 2 {
                return Float(sizeArr[0])
            }
            return 0.0
        }
    }
    
    
    required init(){
        
    }
}

//{
//    "orientation" : "portrait",
//    "idiom" : "ipad",
//    "extent" : "full-screen",
//    "minimum-system-version" : "7.0",
//    "scale" : "2x"
//    "subtype" : "667h",
//}



enum HHLIOrientation:String,HandyJSONEnum {
    case portrait = "portrait"
    case landscape = "landscape"
}

class HHLaunchImageModel: HHIconModel {
    var extent:String = "full-screen"
    var orientation:HHLIOrientation = .portrait
    var minimum_system_version:String = "7.0"
    var subtype:String = ""
}
