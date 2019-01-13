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
    
    func clear() {
        isClear = true
    }
    
    func getLast() -> NSPasteboardItem? {
        guard let object = object,
              let data = object.content.data,
              let type = object.content.type else {
            return nil
        }
        
        let item = NSPasteboardItem()
        item.setData(data, forType: type)
        
        return item
    }
}
