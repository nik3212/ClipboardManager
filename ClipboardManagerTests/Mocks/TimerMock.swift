//
//  TimerMock.swift
//  ClipboardManagerTests
//
//  Created by Никита Васильев on 16/04/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

@testable import ClipboardManager

class TimerFactoryMock: TimerFactory {
    func create(timeInterval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> DefaultTimer {
        return Timer(timeInterval: 0.0, repeats: false, block: block)
    }
}
