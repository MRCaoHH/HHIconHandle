//
//  HHFileView.swift
//  HHIconHandle
//
//  Created by henry on 2017/9/12.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Cocoa

protocol HHFileViewDelegate {
    func fileViewDragging(fileNames:[String]);
}

class HHFileView: NSButton {
    var delegate:HHFileViewDelegate?
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.register(forDraggedTypes: [NSFilenamesPboardType])
        // Drawing code here.
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return .copy
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return self.draggingEntered(_:sender)
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        let pasteboardboard:NSPasteboard = sender.draggingPasteboard()
        if (pasteboardboard.types?.contains(NSFilenamesPboardType) == true) {
            let fileNames:[String] = pasteboardboard.propertyList(forType: NSFilenamesPboardType) as! Array
            var filterFileNames:[String] = []
            for fileName in fileNames {
                if checkFile(fileName: fileName) {
                    filterFileNames.append(fileName)
                }
            }
            self.delegate?.fileViewDragging(fileNames: filterFileNames)
            return true
        }
        return false
    }
    
    func checkFile(fileName:String) -> Bool{
        let extendedNames = ["jpeg","JPEG","png","PNG","jpg","JPG"]
        let url = URL(fileURLWithPath: fileName)
        return extendedNames.contains(url.pathExtension)
    }
}
