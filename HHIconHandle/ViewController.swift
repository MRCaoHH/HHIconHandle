//
//  ViewController.swift
//  HHIconHandle
//
//  Created by henry on 2017/8/28.
//  Copyright © 2017年 caohuihui. All rights reserved.
//

import Cocoa

/// main view controller
class ViewController: NSViewController,NSComboBoxDelegate,HHFileViewDelegate {

    enum HHPhoneAppIconType:Int {
        case phoneNone = 0//无
        case phoneIOS1_0 = 1//iOS 1.0 以上版本
        case phoneIOS7_0 = 2//iOS 7.0 以上版本
    }
    
    enum HHPadAppIconType:Int {
        case padNone = 0//无
        case padIOS3_0 = 1//iOS 3.0 以上版本
        case padIOS7_0 = 2//iOS 7.0 以上版本
    }

//    enum HHCustomIconType:Int {
//        case oneScale = 0//1x
//        case towScale = 1//2x
//        case threeScale = 2//3x
//    }
    
    enum HHLauchImageType {
        case phonePortrait8//phone iOS 8 系统竖屏启动图
        case phoneLandscape8//phone iOS 8 系统横屏启动图
        case phonePortrait7//phone iOS 7 系统竖屏启动图
        case padPortrait7//pad iOS 7 系统竖屏启动图
        case padLandscape7//pad iOS 7 系统横屏启动图
    }
    
    enum HHIconHandleTypoe {
        case AppIcon//app icon
        case LaunchImage//launch image
        case CustomIcon//custom icon
    }
    
    /*
     * MARK: - 属性 -
     */
    /// select image path
    var imgPath:String! = ""
    
    /// 图片数组
    var imageNames:[String] = []
    
    /// 选择图片的按钮
    @IBOutlet weak var customView: HHFileView!
    /// 图像
    @IBOutlet weak var imageView: NSImageView!
    
    /// iphone icon none
    @IBOutlet weak var phoneIconNone: NSButton!
    /// phone icon
    @IBOutlet weak var phoneIcon: NSButton!
    /// phone icon 7
    @IBOutlet weak var phoneIcon7: NSButton!
    
    /// pad icon none
    @IBOutlet weak var padIconNone: NSButton!
    /// pad icon
    @IBOutlet weak var padIcon: NSButton!
    /// pad icon 7
    @IBOutlet weak var padIcon7: NSButton!
    
    /// phone launch image portrait for ios 8
    @IBOutlet weak var phonePortrait8: NSButton!
    /// phone launch image landscape for ios 8
    @IBOutlet weak var phoneLandscape8: NSButton!
    /// phone launch image portrait for ios 7
    @IBOutlet weak var phonePortrait7: NSButton!
    
    /// pad launch image portrait for ios 7
    @IBOutlet weak var padPortrait7: NSButton!
    /// pad launch image landscape for ios 7
    @IBOutlet weak var padLandscape7: NSButton!
    
    /// custom icon 1x
    @IBOutlet weak var customIcon1: NSButton!
    /// custom icon 2x
    @IBOutlet weak var customIcon2: NSButton!
    /// custom icon 3x
    @IBOutlet weak var customIcon3: NSButton!
    
    /// app icon button
    @IBOutlet weak var appIcon: NSButton!
    /// launch image button
    @IBOutlet weak var launchImg: NSButton!
    /// custom icon button
    @IBOutlet weak var customIcon: NSButton!
    
    /*
     * MARK: - 父类方法 -
     */
    /// 视图准备出现
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customView.delegate = self
        
        appIcon.image = NSImage(imageLiteralResourceName: "Circle")
        appIcon.alternateImage = NSImage(imageLiteralResourceName: "Float")
        
        launchImg.image = NSImage(imageLiteralResourceName: "Circle")
        launchImg.alternateImage = NSImage(imageLiteralResourceName: "Float")
        
        customIcon.image = NSImage(imageLiteralResourceName: "Circle")
        customIcon.alternateImage = NSImage(imageLiteralResourceName: "Float")
        
        updateCheckBoxState()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    /*
     * MARK: - 选择图片 -
     */
    @IBAction func clickImgBtn(_ sender: Any) {
        let openPanel =  NSOpenPanel()
        openPanel.canChooseDirectories = false;
        openPanel.canChooseFiles = true;
        openPanel.allowsMultipleSelection = false
        openPanel.allowedFileTypes = ["jpeg","JPEG","png","PNG","jpg","JPG"]
        openPanel.begin { (result) in
            if result != 0{
                self.displayImg(imgPath: openPanel.url!.path)
            }
        }
    }
    
    func displayImg(imgPath:String){
        self.imgPath = imgPath
        self.imageView.image = NSImage(contentsOfFile: imgPath)
    }

    /*
     * MARK: - 选择图片处理类型 -
     */
    /// 点击 Phone Icon 按钮事件
    ///
    /// - Parameter sender: 点击的按钮实例
    @IBAction func clickPhoneIconBtn(_ sender: Any) {
        let btn = sender as! NSButton
        radioFunc(selBtn: btn, btnArr: [phoneIconNone,phoneIcon,phoneIcon7])
    }
    
    /// 点击 Pad Icon 按钮事件
    ///
    /// - Parameter sender: 点击的按钮实例
    @IBAction func clickPadIconBtn(_ sender: Any) {
        let btn = sender as! NSButton
        radioFunc(selBtn: btn, btnArr: [padIconNone,padIcon,padIcon7])
    }
    
    /// 点击 Custom Icon 按钮事件
    ///
    /// - Parameter sender: 点击的按钮实例
    @IBAction func clickCustomIconBtn(_ sender: Any) {
        let btn = sender as! NSButton
        radioFunc(selBtn: btn, btnArr: [customIcon,appIcon,launchImg])
        updateCheckBoxState()
    }
    
    /// 点击 Launch Image 按钮事件
    ///
    /// - Parameter sender: 点击的按钮实例
    @IBAction func clickLaunchImageBtn(_ sender: Any) {
        let btn = sender as! NSButton
        radioFunc(selBtn: btn, btnArr: [customIcon,appIcon,launchImg])
        updateCheckBoxState()
    }
    
    /// 点击app icon 按钮事件
    ///
    /// - Parameter sender: 点击的按钮实例
    @IBAction func clickAppIconBtn(_ sender: Any) {
        let btn = sender as! NSButton
        radioFunc(selBtn: btn, btnArr: [customIcon,appIcon,launchImg])
        updateCheckBoxState()
    }
    
    /// 更新checkBox状态
    func updateCheckBoxState(){
        //Custom Icon
        customIcon1.isEnabled = customIcon.state == 0 ? false : true
        customIcon2.isEnabled = customIcon.state == 0 ? false : true
        customIcon3.isEnabled = customIcon.state == 0 ? false : true
        
        //Launch Image
        padPortrait7.isEnabled = launchImg.state == 0 ? false : true
        padLandscape7.isEnabled = launchImg.state == 0 ? false : true
        phonePortrait7.isEnabled = launchImg.state == 0 ? false : true
        phonePortrait8.isEnabled = launchImg.state == 0 ? false : true
        phoneLandscape8.isEnabled = launchImg.state == 0 ? false : true
        
        //App Icon
        phoneIconNone.isEnabled = appIcon.state == 0 ? false : true
        phoneIcon.isEnabled = appIcon.state == 0 ? false : true
        phoneIcon7.isEnabled = appIcon.state == 0 ? false : true
        
        padIconNone.isEnabled = appIcon.state == 0 ? false : true
        padIcon.isEnabled = appIcon.state == 0 ? false : true
        padIcon7.isEnabled = appIcon.state == 0 ? false : true
    }
    
    /// 单选方法
    ///
    /// - Parameters:
    ///   - selBtn: 选中的按钮
    ///   - btnArr: 单选按钮组
    func radioFunc(selBtn:NSButton, btnArr:[NSButton]){
        selBtn.state = 1
        for btn in btnArr{
            if btn != selBtn {
                btn.state = 0
            }
        }
    }
    
    /*
     * MARK: - 转换图片 -
     */
    /// 点击转换按钮
    ///
    /// - Parameter sender: 按钮实例
    @IBAction func clickConvertBtn(_ sender: Any){
        let savePanel = NSOpenPanel()
        savePanel.canCreateDirectories = true
        savePanel.canChooseFiles = false
        savePanel.canChooseDirectories = true
        weak var weakSelf = self
        savePanel.begin { (result) in
            if result != 0{
                let handelType =  weakSelf?.getCurrentHandelType()
                let url = savePanel.url?.path
                if url == nil {
                    return
                }
                if handelType == .CustomIcon{
                   weakSelf?.convertCustomIconFunc(url: (savePanel.url?.path)!)
                }else{
                   weakSelf?.convertCommonIconFunc(url: (savePanel.url?.path)!)
                }
                
            }
        }
    }
    
    
    func convertCustomIconFunc(url:String){
        let icons =  self.getIconModelList()
        var scale:CGFloat = 1
        
        // @3x
        if customIcon1.state == 1{
            scale = 1
        }
        
        // @2x
        if customIcon2.state == 1{
            scale = 2
        }
        
        if customIcon3.state == 1 {
            scale = 3
        }
        
        for imagePath in imageNames {
            let image:NSImage = NSImage(contentsOfFile: imagePath)!
            let width:CGFloat = image.size.width / scale
            let height:CGFloat = image.size.height / scale
            
            for iconModel in icons {
                iconModel.size = "\(width)x\(height)"
            }
            
            let imageConfig:HHImageConfig! = HHImageConfig()
            imageConfig.images = icons
            self.convertImgFunc(imgPath: imagePath, savePath: url, imgConfig: imageConfig,handelType:.CustomIcon)
        }
        
    }
    
    func convertCommonIconFunc(url:String){
        let icons =  self.getIconModelList()
        let imageConfig:HHImageConfig! = HHImageConfig()
        imageConfig.images = icons
        let handelType =  self.getCurrentHandelType()
        self.convertImgFunc(imgPath: self.imgPath, savePath: url, imgConfig: imageConfig,handelType: handelType )
    }
    
    /// 图片转换方法
    ///
    /// - Parameters:
    ///   - imgPath: 待转换图片的路径
    ///   - savePath: 保存图片路径
    ///   - icons: icon模型数组
    func convertImgFunc(imgPath:String!,savePath:String!,imgConfig:HHImageConfig,handelType:HHIconHandleTypoe) {
        var dirURL = URL(fileURLWithPath: savePath)
        var fileName = "Icon"
        switch handelType {
        case .AppIcon:
            dirURL.appendPathComponent("AppIcon.appiconset")
            fileName = "AppIcon"
            break
        case .LaunchImage:
            dirURL.appendPathComponent("LaunchImage.launchimage")
            fileName = "LaunchImage"
            break
        case .CustomIcon:
            let imgURL = URL(fileURLWithPath: imgPath)
            fileName = NSString(string:imgURL.lastPathComponent).deletingPathExtension
            dirURL.appendPathComponent(fileName)
            dirURL.appendPathExtension("imageset")
            break
        }
        
        let fileManager = FileManager()
        let isDirectory = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
        isDirectory.pointee = true
        let isExists = fileManager.fileExists(atPath: dirURL.path, isDirectory: isDirectory)
        if isExists == false || isDirectory.pointee.boolValue == false  {
            //创建文件夹
            do {
                try fileManager.createDirectory(at: dirURL, withIntermediateDirectories: false, attributes: nil)
                for iconModel in imgConfig.images! {
                    var scale:Float = 1.0
                    var outImgName = fileName + String(Int(iconModel.height))
                    switch iconModel.scale.rawValue {
                    case HHIconScale.oneScale.rawValue:
                        scale = 1.0
                        break
                    case HHIconScale.towScale.rawValue:
                        scale = 2.0
                        outImgName += "@2x"
                        break
                    case HHIconScale.threeScale.rawValue:
                        scale = 3.0
                        outImgName += "@3x"
                        break
                    default:
                        scale = 1.0
                        break
                    }
                    
                    var outImgPath:URL = dirURL.appendingPathComponent(outImgName)
                    outImgPath.appendPathExtension("png")
                    iconModel.filename = outImgPath.lastPathComponent
                    let _ = HHImageTool.convertImg(orgImgPath: imgPath, width: iconModel.width * scale, height: iconModel.height * scale, outImgPath: outImgPath.path)
                    
                }
                var jsonString = imgConfig.toJSONString(prettyPrint: true)
                jsonString = jsonString?.replacingOccurrences(of: "minimum_system_version", with: "minimum-system-version")
                jsonString = jsonString?.replacingOccurrences(of: "\"subtype\" : \"\",", with: "")
                let contentJsonUrl = dirURL.appendingPathComponent("Contents.json")
                let _ = try jsonString?.write(to: contentJsonUrl, atomically: true, encoding: .utf8)
            } catch let error {
                print("\(error)")
            }
            
        }
        isDirectory.deallocate(capacity: 1)
    }
    
    /// 得到icon模型数组
    ///
    /// - Returns: 当前配置的模型数组
    func getIconModelList() -> [HHIconModel] {
        switch getCurrentHandelType() {
        case .AppIcon:
            return getAppIconModelList()
        case .LaunchImage:
            return getLaunchImageModelList()
        case .CustomIcon:
            return getCustomIconModelList()
        }
    }
    
    
    /// 得到当前的处理类型
    ///
    /// - Returns: icon处理类型
    func getCurrentHandelType() -> HHIconHandleTypoe{
        if appIcon.state == 1 {
            return .AppIcon
        }
        
        if launchImg.state == 1 {
            return .LaunchImage
        }
        
        if customIcon.state == 1 {
            return .CustomIcon
        }
        
        return .CustomIcon
    }
    
    /// 得到app icon的icon 模型列表
    ///
    /// - Returns: icon模型数组
    func getAppIconModelList() -> [HHIconModel] {
        var phoneAppIconType:HHPhoneAppIconType = .phoneNone
        if phoneIcon.state == 1 {
            phoneAppIconType = .phoneIOS1_0
        }
        if phoneIcon7.state == 1 {
            phoneAppIconType = .phoneIOS7_0
        }

        var padAppIconType:HHPadAppIconType = .padNone
        if padIcon.state == 1 {
            padAppIconType = .padIOS3_0
        }
        if padIcon7.state == 1 {
            padAppIconType = .padIOS7_0
        }
        
        var iconList:[HHIconModel] = []
        if phoneAppIconType == .phoneIOS1_0 {
            iconList += HHLoadConfig.loadFile(fileName: "HHAppIconIphone")
        } else if phoneAppIconType == .phoneIOS7_0 {
            iconList += HHLoadConfig.loadFile(fileName: "HHAppIconIphone7")
        }
        
        if padAppIconType == .padIOS3_0 {
            iconList += HHLoadConfig.loadFile(fileName: "HHAppIconIpad")
        } else if padAppIconType == .padIOS7_0 {
            iconList += HHLoadConfig.loadFile(fileName: "HHAppIconIpad7")
        }
        return iconList
    }
    
    /// 得到custom icon的icon 模型列表
    ///
    /// - Returns: icon模型数组
    func getCustomIconModelList() -> [HHIconModel] {
        var list:[HHIconModel] = []
        // @3x
        if customIcon3.state == 1{
            let iconModel = HHIconModel()
            iconModel.scale = .threeScale
            list.append(iconModel)
        }
        
        // @2x
        if customIcon2.state == 1{
            let iconModel = HHIconModel()
            iconModel.scale = .towScale
            list.append(iconModel)
        }
        
        if customIcon1.state == 1 {
            let iconModel = HHIconModel()
            iconModel.scale = .oneScale
            list.append(iconModel)
        }
        
        return list
    }
//    
//    func customIconModelWithImage(image:NSImage) -> [HHIconModel]{
//        // @1x
//        var width:Float = 0
//        var height:Float = 0
//        
//        var list:[HHIconModel] = []
//        // @3x
//        if customIcon3.state == 1{
//            let iconModel = HHIconModel()
//            width = image.size.width/3
//            height = image.size.height/3
//            iconModel.size = "\(width)x\(height)"
//            list.append(iconModel)
//        }
//        
//        // @2x
//        if customIcon2.state == 1{
//            let iconModel = HHIconModel()
//            if width == 0 {
//                width = image.size.width/2
//                height = image.size.height/2
//            }
//            iconModel.size = "\(width)x\(height)"
//            list.append(iconModel)
//        }
//        
//        if customIcon1.state == 1 {
//            let iconModel = HHIconModel()
//            if width == 0 {
//                width = image.size.width
//                height = image.size.height
//            }
//            iconModel.size = "\(width)x\(height)"
//            list.append(iconModel)
//        }
//        
//        return list
//    }
    
    /// 得到启动图LaunchImage的模型列表
    ///
    /// - Returns: icon模型数组
    func getLaunchImageModelList() -> [HHIconModel] {
        var iconList:[HHIconModel] = []
        if phonePortrait7.state == 1 {
            iconList += HHLoadConfig.launchScreenList(fileName: "HHLSPhonePortrait7")
        }
        
        if phonePortrait8.state == 1 {
            iconList += HHLoadConfig.launchScreenList(fileName: "HHLSPhonePortrait8")
        }
        
        if phoneLandscape8.state == 1 {
            iconList += HHLoadConfig.launchScreenList(fileName: "HHLSPhoneLandscape8")
        }
        
        if padPortrait7.state == 1 {
            iconList += HHLoadConfig.launchScreenList(fileName: "HHLSPadPortrait7")
        }
        
        if padLandscape7.state == 1 {
            iconList += HHLoadConfig.launchScreenList(fileName: "HHLSPadLandscape7")
        }
        
        return iconList
    }
    
    /*
     * MARK: - 转换图片 -
     */
    func fileViewDragging(fileNames: [String]) {
        if fileNames.count == 0{
            return
        }
        
        imageNames = fileNames
        self.displayImg(imgPath: fileNames.first!)
    }
}
