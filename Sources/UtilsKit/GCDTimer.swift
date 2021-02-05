//
//  GCDTimer.swift
//
//  Created by Stuart on 2019/4/14.
//

import Foundation

public class GCDTimer {
    
    /// 时间间隔
    private let timeInterval: DispatchTimeInterval
    /// 是否循环
    private let isRepeat: Bool
    /// 触发方法
    private let handler: (GCDTimer) -> Void
    /// DispatchSourceTimer引用
    private let timer: DispatchSourceTimer
    /// 计时器是否开始
    public private(set) var isResume = false
    
    /// 创建GCD计时器
    ///
    /// - Parameters:
    ///   - timeInterval: 时间间隔
    ///   - isRepeat: 是否循环
    ///   - action: 触发方法，若在action中使用GCDTimer引用者，需在闭包中定义捕获列表或手动将引用置为nil避免循环引用内存泄漏
    public init(timeInterval: DispatchTimeInterval, isRepeat: Bool, queue: DispatchQueue = .main, handler: @escaping (GCDTimer) -> Void) {
        self.timeInterval = timeInterval
        self.isRepeat = isRepeat
        self.handler = handler
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer.setEventHandler { [weak self] in
            if let noNilSelf = self {
                DispatchQueue.main.async {
                    handler(noNilSelf)
                }
            }
        }
        if isRepeat {
            timer.schedule(deadline: .now() + timeInterval, repeating: timeInterval)
        } else {
            timer.schedule(deadline: .now() + timeInterval)
        }
    }
    
    deinit {
        if !isResume {
            timer.resume()
        }
    }
    
    /// 启动计时器
    public func resume() {
        if !isResume {
            timer.resume()
            isResume.toggle()
        }
    }
    
    /// 暂停计时器
    public func suspend() {
        if isResume {
            timer.suspend()
            isResume.toggle()
        }
    }
    
    /// 重置计时器
    public func reset() {
        if isRepeat {
            timer.schedule(deadline: .now() + timeInterval, repeating: timeInterval)
        } else {
            timer.schedule(deadline: .now() + timeInterval)
        }
    }
    
}

public extension GCDTimer {
    
    private static var workItems = [String: DispatchWorkItem]()
    
    /// Debounce
    /// - Parameter interval: 时间间隔
    /// - Parameter identifier: 任务标识符
    /// - Parameter queue: 队列
    /// - Parameter handler: 所执行任务
    static func debounce(interval: DispatchTimeInterval, identifier: String, queue: DispatchQueue = .main, handler: @escaping () -> Void) {
        if let item = workItems[identifier] {
            item.cancel()
        }
        let item = DispatchWorkItem {
            handler()
            workItems.removeValue(forKey: identifier)
        }
        workItems[identifier] = item
        queue.asyncAfter(deadline: .now() + interval, execute: item)
    }
    
    /// Throttle
    /// - Parameter interval: 时间间隔
    /// - Parameter identifier: 任务标识符
    /// - Parameter queue: 队列
    /// - Parameter handler: 所执行任务
    static func throttle(interval: DispatchTimeInterval, identifier: String, queue: DispatchQueue = .main, handler: @escaping () -> Void) {
        guard workItems[identifier] == nil else { return }
        let item = DispatchWorkItem {
            handler()
            workItems.removeValue(forKey: identifier)
        }
        workItems[identifier] = item
        queue.asyncAfter(deadline: .now() + interval, execute: item)
        
    }
    
    /// 取消Throttle
    /// - Parameter identifier: 任务标识符
    static func cancelThrottleOrDebounceTimer(identifier: String) {
        if let item = workItems[identifier] {
            item.cancel()
            workItems.removeValue(forKey: identifier)
        }
    }
    
}
