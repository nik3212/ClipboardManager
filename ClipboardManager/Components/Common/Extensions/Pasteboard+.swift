//
//  Pasteboard+.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 04/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public protocol PasteboardEngine {
    func write(object: ClipboardItem) -> Bool
    func write(object: Any, type: NSPasteboard.PasteboardType) -> Bool
    func getLast() -> NSPasteboardItem?
    func clear()
}

extension NSPasteboard: PasteboardEngine {
    @discardableResult
    public func write(object: ClipboardItem) -> Bool {
        guard let item = object.content.pasteboardItem else {
            return false
        }
        
        return writeObjects([item])
    }
    
    @discardableResult
    public func write(object: Any, type: NSPasteboard.PasteboardType) -> Bool {
        guard let pasteboardItem = NSPasteboardItem(pasteboardPropertyList: object,
                                                    ofType: type) else {
            return false
        }
        return writeObjects([pasteboardItem])
    }
    
    public func getLast() -> NSPasteboardItem? {
        return pasteboardItems?.last
    }
    
    public func clear() {
        clearContents()
    }
}
