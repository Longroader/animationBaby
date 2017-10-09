//
//  TaskDelay-Extension.swift
//  AnimationKing
//  by: 王巍
//  Created by miss on 2017/9/2.
//  Copyright © 2017年 com.miu.ios. All rights reserved.
//

import Foundation

typealias Task = (_ cancel : Bool) -> Void

// MARK: - delay method
@discardableResult
func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

// MARK: - cancel
func cancel(_ task: Task?) {
    task?(true)
}

