//
//  ClipboardItem.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 05/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol Item {
    /// A Window value that contains the application data.
    var windowInfo: Window { get }
    
    /// A Content value that contains the item and the date.
    var content: Content { get }
}

public struct ClipboardItem: Item {
    public let windowInfo: Window
    
    public let content: Content
    
    public init(window: Window, content: Content) {
        self.windowInfo = window
        self.content = content
    }
}

extension ClipboardItem {
    init(window: Window, pasteboardItem: NSPasteboardItem) {
        let content = ClipboardContent(item: pasteboardItem,
                                       date: Date())
        self.init(window: window, content: content)
    }
}
