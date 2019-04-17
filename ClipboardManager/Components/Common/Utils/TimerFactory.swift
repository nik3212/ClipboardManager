//
//  TimerFactory.swift
//  ClipboardManager
//
//  Created by Никита Васильев on 03/03/2019.
//  Copyright © 2019 Никита Васильев. All rights reserved.
//

import Foundation

public protocol DefaultTimer {
    func invalidate()
}

extension Timer: DefaultTimer { }

public protocol TimerFactory {
    func create(timeInterval: TimeInterval, repeats: Bool, block: @escaping (Timer) -> Void) -> DefaultTimer
}

public class DefaultTimerFactory: TimerFactory {
    public init() { }
    
    public func create(timeInterval: TimeInterval,
                       repeats: Bool,
                       block: @escaping (Timer) -> Void) -> DefaultTimer {
        var timer: DefaultTimer!
        
        if Thread.isMainThread {
            timer = createMainThreadAsserted(timeInterval: timeInterval, repeats: repeats, block: block)
        } else {
            DispatchQueue.main.async {
                timer = self.createMainThreadAsserted(timeInterval: timeInterval, repeats: repeats, block: block)
            }
        }
        
        return timer
    }
    
    fileprivate func createMainThreadAsserted(timeInterval: TimeInterval,
                                              repeats: Bool,
                                              block: @escaping (Timer) -> Void) -> DefaultTimer {
        return Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: repeats, block: block)
    }
}
