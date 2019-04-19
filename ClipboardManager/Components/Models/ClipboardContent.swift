//
//  ClipboardContent.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 05/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol Content {
    /// A NSPasteboardItem value that contains the data and types.
    var pasteboardItem: NSPasteboardItem? { get }
    
    /// A Date value that contains the date when item was saved.
    var date: Date? { get }
}

public class ClipboardContent: Content {
    public let pasteboardItem: NSPasteboardItem?
    
    public let date: Date?
    
    public init(item: NSPasteboardItem?, date: Date?) {
        self.pasteboardItem = item
        self.date = date
    }
}
