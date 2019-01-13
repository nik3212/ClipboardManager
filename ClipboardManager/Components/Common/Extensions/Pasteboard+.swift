//
//  Pasteboard+.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 04/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol PasteboardEngine {
    func write(object: ClipboardItem) -> Bool
    func getLast() -> NSPasteboardItem?
    func clear()
}

extension NSPasteboard: PasteboardEngine {
    
    @discardableResult
    public func write(object: ClipboardItem) -> Bool {
        if let data = object.content.data,
           let type = object.content.type {
            let pasteboardItem = NSPasteboardItem()
            pasteboardItem.setData(data, forType: type)
            return writeObjects([pasteboardItem])
        }

        return false
    }
    
    public func getLast() -> NSPasteboardItem? {
        return pasteboardItems?.last
    }
    
    public func clear() {
        clearContents()
    }
}
