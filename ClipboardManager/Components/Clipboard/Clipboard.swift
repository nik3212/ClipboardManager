//
//  Clipboard.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 04/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

public typealias ClipboardType = NSPasteboard.PasteboardType

class Clipboard: ClipboardEngine {
    
    // MARK: Properties
    
    /// Instance of a pasteboard.
    private var pasteboard: PasteboardEngine!

    // MARK: Initialization
    
    /// Returns the Clipboard object.
    ///
    /// - Parameter pasteboard: An PasteboardEngine object containing the object to work with system pasteboard.
    init(pasteboard: PasteboardEngine = NSPasteboard.general) {
        self.pasteboard = pasteboard
    }
    
    // MARK: Public Methods
    
    /// Fetch an object from the system pasteboard.
    ///
    /// - Returns: A tuple containing the data and the type of this data.
    func fetch() -> NSPasteboardItem? {
        return pasteboard.getLast()
    }
    
    /// Set clipboard item to system pasteboard.
    ///
    /// - Parameter item: An ClipboardItem object containing the value for the representation specified by type.
    func set(item: ClipboardItem) {
        pasteboard.clear()
        _ = pasteboard.write(object: item)
    }
    
    /// Set clipboard item to system pasteboard.
    ///
    /// - Parameters:
    ///   - object: A property list containing data to initialize the receiver.
    ///   - type: A UTI supported by the receiver for reading (one of the types returned by readableTypes(for:)).
    func set(object: Any, type: NSPasteboard.PasteboardType) {
        pasteboard.clear()
        _ = pasteboard.write(object: object, type: type)
    }
    
    /// Clears the existing contents of the pasteboard
    func clearContents() {
        pasteboard.clear()
    }
}
