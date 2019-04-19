//
//  PasteboardMock.swift
//  ClipboardManagerTests
//
//  Created by Никита Васильев on 04/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

import Cocoa
import ClipboardManager

class PasteboardMock: PasteboardEngine {
    
    var object: ClipboardItem?
    
    private(set) var isClear: Bool = false
    
    func write(object: ClipboardItem) -> Bool {
        self.object = object
        return true
    }
    
    func write(object: Any, type: NSPasteboard.PasteboardType) -> Bool {
        return true
    }
    
    func clear() {
        isClear = true
    }
    
    func getLast() -> NSPasteboardItem? {
        guard let item = object?.content.pasteboardItem else { return nil }
        return item
    }
}
