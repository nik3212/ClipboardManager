//
//  ClipboardItem+.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 05/12/2018.
//  Copyright © 2018 Никита Васильев. All rights reserved.
//

extension ClipboardItem: Equatable {
    public static func ==(lhs: ClipboardItem, rhs: ClipboardItem) -> Bool {
        return lhs.content.data == rhs.content.data
    }
}
