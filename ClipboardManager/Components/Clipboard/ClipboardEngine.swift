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
    func fetch() throws -> PasteboardItem
    
    /// Set data to system pasteboard.
    ///
    /// - Parameter item: An item to be inserted to the pasteboard.
    func set(item: ClipboardItem)
    
    /// Remove data from pasteboard.
    func clearContents()
}
