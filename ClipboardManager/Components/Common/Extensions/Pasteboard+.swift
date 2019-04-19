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
        guard let item = object.content.pasteboardItem else {
            return false
        }
        
        return writeObjects([item])
    }
    
    public func getLast() -> NSPasteboardItem? {
        return pasteboardItems?.last
    }
    
    public func clear() {
        clearContents()
    }
}
