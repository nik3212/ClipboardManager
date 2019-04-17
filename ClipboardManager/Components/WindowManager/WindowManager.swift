//
//  WindowManager.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

import Cocoa

class WindowManager {
    
    // MARK: Properties
    
    private var options: CGWindowListOption!
    private var cgWindowListInfo: CFArray!
    private var cgWindowListInfo2: [[String: AnyObject]]!
    
    private var frontMostAppID = Int(NSWorkspace.shared.frontmostApplication!.processIdentifier)
    
    private var contentProvider: ContentProvider
    
    var windowInfo: WindowInfo {
        return WindowInfo(icon: applicationIcon(),
                          applicationName: applicationName())
    }
    
    static let shared = WindowManager()
    
    // MARK: Initialization
    
    private init() {
        contentProvider = ContentProvider()
        updateActiveWindow()
    }
    
    // MARK: Private Methods
    
    private func getActiveWindowPid() -> Int? {
        updateActiveWindow()
        
        for windowDic in cgWindowListInfo2! {
            var title = windowDic["kCGWindowName"] as? String
            title = (title?.count != 0) ? title : nil
            
            let ownerProcessID = windowDic["kCGWindowOwnerPID"] as! Int
            if frontMostAppID == ownerProcessID {
                return frontMostAppID
            }
        }
        
        return nil;
    }
    
    private func applicationIcon() -> NSImage? {
        guard let pid = getActiveWindowPid() else { return nil }
        
        contentProvider.setPid(pid_t(pid))
        
        let path = contentProvider.getPath()
        let plistPath = contentProvider.getPlistPath(path)
        
        if let dict = NSDictionary(contentsOf: URL(fileURLWithPath: plistPath!)) {
            guard let iconName = dict["CFBundleIconFile"] as? String else {
                return nil
            }
            
            let iconPath = path! + "/Resources/" + iconName + ".icns"
            return NSImage(contentsOfFile: iconPath)
        }
        
        return nil
    }
    
    private func applicationName() -> String? {
        guard let pid = getActiveWindowPid() else { return nil }
        
        contentProvider.setPid(pid_t(pid))
        
        let path = contentProvider.getPath()
        let plistPath = contentProvider.getPlistPath(path)
        
        if let dict = NSDictionary(contentsOf: URL(fileURLWithPath: plistPath!)) {
            guard let name = dict["CFBundleName"] as? String else { return nil }
            return name
        }
        
        return nil
    }
    
    private func updateActiveWindow() {
        frontMostAppID = Int(NSWorkspace.shared.frontmostApplication!.processIdentifier)
        options = CGWindowListOption(arrayLiteral: CGWindowListOption.optionAll)
        cgWindowListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
        cgWindowListInfo2 = cgWindowListInfo as NSArray? as? [[String: AnyObject]]
    }
}
