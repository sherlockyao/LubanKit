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
