//
//  HHImageTool.swift
//  HHIconHandle
//
//  Created by henry on 2017/8/28.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Foundation


class HHImageTool{
    class func convertImg(orgImgPath:String,width:Float,height:Float,outImgPath:String) -> Bool{
        let process =  Process()
        process.launchPath = "/usr/bin/sips"
        process.arguments = ["-z",String(height),String(width),orgImgPath,"--out",outImgPath]
//        process.terminationHandler = { pro in
//            isFinsh = true
//            print(">>>>>>>>>>>>>\()")
//        }
        process.launch()
        process.waitUntilExit()
        return process.terminationStatus == 0 ? true : false
    }
}
