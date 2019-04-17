//
//  ClipboardCheckerDelegateMock.swift
//  ClipboardManagerTests
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

@testable import ClipboardManager

class ClipboardCheckerDelegateMock: ClipboardCheckerDelegate {
    var item: ClipboardItem?
    
    func clipboardDidChanged(item: ClipboardItem) {
        self.item = item
    }
}
