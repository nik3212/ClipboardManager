//
//  ClipboardTests.swift
//  ClipboardManagerTests
//
//  Created by Никита Васильев on 04/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

import XCTest

@testable import ClipboardManager

class ClipboardTests: XCTestCase {

    var pasteboard: PasteboardMock!
    var clipboard: Clipboard!
    
    var window: WindowInfo!
    var content: Content!
    
    private var testObject: ClipboardItem!
    
    override func setUp() {
        setup()
    }

    override func tearDown() {
        pasteboard = nil
        clipboard = nil
        testObject = nil
    }
    
    func testSetDataToClipboard() {
        clipboard.set(item: testObject)
        XCTAssertEqual(testObject, pasteboard.object!, "Objects should be equal")
    }
    
    func testGetDataFromClipboard() {
        pasteboard.object = testObject
        do {
            let response = try clipboard.fetch()
            XCTAssertEqual(response, testObject.content.pasteboardItem, "Data should be equal")
        } catch {
            XCTFail("Can not fetch data from clipboard")
        }
    }
    
    func testThatCouldNotGetDataFromClipboard() {
        let content = ClipboardContent(item: nil,
                                       date: nil)
        
        let windowInfo = WindowInfo(icon: nil,
                                    applicationName: nil)
        
        let item = ClipboardItem(window: windowInfo,
                                 content: content)
        
        pasteboard.object = item
        
        
        XCTAssertThrowsError(try clipboard.fetch())
    }
    
    private func setup() {
        pasteboard = PasteboardMock()
        clipboard = Clipboard(pasteboard: pasteboard)
        testObject = createFakeClipboardItem(text: "Test text",
                                             type: .string)
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
