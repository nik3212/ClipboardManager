//
//  ClipboardEngine.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

protocol ClipboardEngine {
    /// Fetch data from system pasteboard.
    ///
    /// - Returns: A tuple that contains a data and a pasteboard type.
    /// - Throws: `ClipboardError.invalidFetch`.
    func fetch() throws -> NSPasteboardItem
    
    /// Set data to system pasteboard.
    ///
    /// - Parameter item: An item to be inserted to the pasteboard.
    func set(item: ClipboardItem)
    
    /// Set data to system pasteboard.
    ///
    /// - Parameters:
    ///   - object: A property list containing data to initialize the receiver.
    ///   - type: A UTI supported by the receiver for reading (one of the types returned by readableTypes(for:)).
    func set(object: Any, type: NSPasteboard.PasteboardType)
    
    /// Remove data from pasteboard.
    func clearContents()
}
