//
//  ClipboardItem.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 05/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol Item {
    var windowInfo: Window { get }
    var content: Content { get }
}

public struct ClipboardItem: Item {
    public let windowInfo: Window
    
    public let content: Content
}
