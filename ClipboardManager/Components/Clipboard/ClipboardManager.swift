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
    
    /// Stored all items from the system clipboard.
    private(set) var items = [ClipboardItem]()
    
    /// A ClipboardEngine value that contains the system clipboard instance.
    private let clipboard: ClipboardEngine = Clipboard()
    
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
    public func copy(item: ClipboardItem) {
        clipboard.set(item: item)
    }
    
    /// Remove item from history.
    ///
    /// - Parameter item: Item to be deleted.
    public func remove(item: ClipboardItem) {
        items = items.filter { $0 != item }
    }
    
    /// Clear stored data and item in the system clipboard.
    public func clear() {
        items.removeAll()
        clipboard.clearContents()
    }
}

// MARK: Delegates

extension ClipboardManager: ClipboardCheckerDelegate {
    func clipboardDidChanged(item: ClipboardItem) {
        items.append(item)
        delegate?.clipboardDidChange(item: item)
    }
}
