//
//  ClipboardManager.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

public protocol ClipboardManagerDelegate: class {
    /// Tells the delegate that clipboard item has changed.
    ///
    /// - Parameter item: A new copied item.
    func clipboardDidChange(item: ClipboardItem)
}

public final class ClipboardManager {
    
    // MARK: Properties
    
    /// An instance of ClipboardManagerDelegate.
    public weak var delegate: ClipboardManagerDelegate?
    
    /// A ClipboardEngine value that contains the system clipboard instance.
    private var clipboard: ClipboardEngine = Clipboard()
    
    /// A ClipboardChecker value that contains the clipboard checker instance.
    private let clipboardChecker: ClipboardChecker
    
    // MARK: Initialization
    
    /// Returns the ClipboardManager object.
    public init() {
        clipboardChecker = ClipboardChecker(clipboard: clipboard)
        clipboardChecker.delegate = self
    }
    
    // MARK: Public Methods
    
    /// Copy the item to the system clipboard.
    ///
    /// - Parameter item: Item to be copy to the system clipboard.
    public func copy(_ item: ClipboardItem) {
        clipboard.set(item: item)
    }
    
    /// Copy the item to the system clipboard.
    ///
    /// - Parameters:
    ///   - object: A property list containing data to initialize the receiver.
    ///   - type: A UTI supported by the receiver for reading (one of the types returned by readableTypes(for:)).
    public func copy(object: Any, type: NSPasteboard.PasteboardType) {
        clipboard.set(object: object, type: type)
    }
    
    /// Clear stored data and item in the system clipboard.
    public func clear() {
        clipboard.clearContents()
    }
}

// MARK: Delegates

extension ClipboardManager: ClipboardCheckerDelegate {
    func clipboardDidChanged(item: ClipboardItem) {
        delegate?.clipboardDidChange(item: item)
    }
}
