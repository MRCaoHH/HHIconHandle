//
//  AppDelegate.swift
//  HHIconHandle
//
//  Created by henry on 2017/8/28.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSWindowDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        NSApplication.shared().keyWindow?.delegate = self;
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func windowWillClose(_ notification: Notification) {
        NSApplication.shared().terminate(NSApplication.shared())
    }
}

