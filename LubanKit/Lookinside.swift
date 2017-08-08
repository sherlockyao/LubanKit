//
//  Lookinside.swift
//  LubanKit
//
//  Created by Sherlock Yao on 2017/8/2.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import Foundation

fileprivate var viewStack = Stack<UIView>()

public func lookinside(_ view: UIView, block: () -> ()) {
    viewStack.push(view)
    block()
    viewStack.pop()
}

internal func container() -> UIView? {
    return viewStack.top
}


fileprivate enum Axis {
    case horizontal, vertical
}

fileprivate var axisStack = Stack<Axis>()

public func horizontal(block: () -> ()) {
    axisStack.push(.horizontal)
    block()
    axisStack.pop()
}

public func vertical(block: () -> ()) {
    axisStack.push(.vertical)
    block()
    axisStack.pop()
}

internal func xaxis() -> Bool {
    guard let axis = axisStack.top else {
        return true
    }
    
    return axis == .horizontal
}
