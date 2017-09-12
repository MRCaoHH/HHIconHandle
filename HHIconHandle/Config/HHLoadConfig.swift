//
//  HHLoadConfig.swift
//  HHIconHandle
//
//  Created by henry on 2017/8/28.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Foundation

class HHLoadConfig{
//    static public var appIconList:[HHIconModel] {
//        
//        let configPath = Bundle.main.path(forResource: "HHAppIcon", ofType: "plist")
//        let iconList = NSArray(contentsOfFile: configPath ?? "")
//        let iconModelArr =  [HHIconModel].deserialize(from: iconList)
//        if iconModelArr == nil {
//            return []
//        }
//        return iconModelArr as! [HHIconModel]
//        
//    }
    
    public class func launchScreenList(fileName:String) -> [HHIconModel] {
        let configPath = Bundle.main.path(forResource: fileName, ofType: "plist")
        let iconList = NSArray(contentsOfFile: configPath ?? "")
        let iconModelArr =  [HHLaunchImageModel].deserialize(from: iconList)
        if iconModelArr == nil {
            return []
        }
        return iconModelArr as! [HHIconModel]
        
    }
    
    public class func loadFile(fileName:String) -> [HHIconModel] {
        let configPath = Bundle.main.path(forResource: fileName, ofType: "plist")
        let iconList = NSArray(contentsOfFile: configPath ?? "")
        let iconModelArr =  [HHIconModel].deserialize(from: iconList)
        if iconModelArr == nil {
            return []
        }
        return iconModelArr as! [HHIconModel]
    }

}
