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
            XCTAssertEqual(response.0, testObject.content.data, "Data should be equal")
            XCTAssertEqual(response.1, testObject.content.type, "Types shoild be equal")
        } catch {
            XCTFail("Can not fetch data from clipboard")
        }
    }
    
    func testThatCouldNotGetDataFromClipboard() {
        pasteboard.object = createFakeClipboardItem(text: nil, type: nil)
        XCTAssertThrowsError(try clipboard.fetch())
    }
    
    private func setup() {
        pasteboard = PasteboardMock()
        clipboard = Clipboard(pasteboard: pasteboard)
        testObject = createFakeClipboardItem(text: "Test text",
                                             type: .string)
    }
    
    private func createFakeClipboardItem(text: String?,
                                         type: NSPasteboard.PasteboardType?) -> ClipboardItem {
        let testData = text?.data(using: .utf8)
        
        let window = WindowInfo(icon: nil, applicationName: "Test application")
        let content = ClipboardContent(data: testData,
                                       date: nil,
                                       type: type)
        
        return ClipboardItem(window: window,
                             content: content)
    }
}
