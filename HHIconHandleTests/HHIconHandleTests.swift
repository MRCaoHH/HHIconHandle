//
//  HHIconHandleTests.swift
//  HHIconHandleTests
//
//  Created by henry on 2017/8/28.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import XCTest
import SwiftyJSON
import ObjectMapper
import HandyJSON
import Foundation

@testable import HHIconHandle

class HHIconHandleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testFileNameCheck() {
        let fileNames = [
            "/Users/henry/Desktop/color.PNG/",
            "/Users/henry/Desktop/color.png/",
            "/Users/henry/Desktop/color.JPEG/",
            "/Users/henry/Desktop/color.JPG/",
            "/Users/henry/Desktop/color.jpg/",
            "/Users/henry/Desktop/color.jpeg/",
            "/Users/henry/Desktop/color.png3/",
            "/Users/henry/Desktop/color.1png/"
        ]
        let view =  HHFileView()
        for fileName in fileNames{
            if view.checkFile(fileName: fileName) {
                print("pass:\(fileName)")
            }else{
                print("err:\(fileName)")
            }
        }
        
    }
}
