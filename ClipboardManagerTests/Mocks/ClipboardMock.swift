//
//  ClipboardMock.swift
//  ClipboardManagerTests
//
//  Created by Никита Васильев on 22/01/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

import ClipboardManager

class ClibpoardMock: ClipboardEngine {
    
    var item: ClipboardItem?
    
    private(set) var isClear = false
    
    func fetch() throws -> (Data, NSPasteboard.PasteboardType) {
        return (Data(), NSPasteboard.PasteboardType.string)
    }
    
    func set(item: ClipboardItem) {
        self.item = item
    }
    
    func clearContents() {
        isClear = true
    }
}
