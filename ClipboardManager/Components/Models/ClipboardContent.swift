//
//  ClipboardContent.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 05/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol Content {
    var data: Data? { get }
    var date: Date? { get }
    var type: NSPasteboard.PasteboardType? { get }
}

public class ClipboardContent: Content {
    public let data: Data?
    
    public let date: Date?
    
    public let type: NSPasteboard.PasteboardType?
    
    public init(data: Data?, date: Date?, type: NSPasteboard.PasteboardType?) {
        self.data = data
        self.date = date
        self.type = type
    }
}
