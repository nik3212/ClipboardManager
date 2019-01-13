//
//  WindowInfo.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 05/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol Window {
    var icon: NSImage? { get }
    var applicationName: String? { get }
}

public struct WindowInfo: Window {
    public let icon: NSImage?
    
    public let applicationName: String?
}
