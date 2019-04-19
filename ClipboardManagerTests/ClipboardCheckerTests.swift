//
//  ClipboardCheckerTests.swift
//  ClipboardManagerTests
//
//  Created by Никита Васильев on 22/01/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

import XCTest

@testable import ClipboardManager

class ClipboardCheckerTests: XCTestCase {

    var pasteboard: PasteboardMock!
    var clipboard: Clipboard!
    var clipboardChecker: ClipboardChecker!
    var checkerDelegate: ClipboardCheckerDelegateMock!
    
    private let timerFactory = TimerFactoryMock()
    
    override func setUp() {
        pasteboard = PasteboardMock()
        clipboard = Clipboard(pasteboard: pasteboard)
        checkerDelegate = ClipboardCheckerDelegateMock()
        clipboardChecker = ClipboardChecker(clipboard: clipboard, timerFactory: timerFactory)
        clipboardChecker.delegate = checkerDelegate
    }

    override func tearDown() {
        pasteboard = nil
        clipboardChecker = nil
    }
    
    func testFetchObjectIsCorrect() {
        let item = createFakeClipboardItem(text: "Test", type: .string)
        clipboard.set(item: item)
        clipboardChecker.checkClipboard()
        XCTAssertEqual(item, checkerDelegate.item, "Items should be equal")
    }
    
    private func createFakeClipboardItem(text: String,
                                         type: NSPasteboard.PasteboardType) -> ClipboardItem {
        let window = WindowInfo(icon: nil, applicationName: "Test application")
        
        let pasteboardItem = NSPasteboardItem(pasteboardPropertyList: text,
                                              ofType: type)

        let content = ClipboardContent(item: pasteboardItem,
                                       date: nil)

        return ClipboardItem(window: window,
                             content: content)
    }
}
