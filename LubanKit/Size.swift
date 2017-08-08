//
//  Size.swift
//  LubanKit
//
//  Created by Sherlock Yao on 2017/8/8.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import Foundation

fileprivate enum Size {
    case width, height
}

public struct ViewSize {
    fileprivate let view: UIView?
    fileprivate let size: Size
}

public let square = ViewSize(view: nil, size: .height)

public extension UIView {
    
    public var shape: ViewSize {
        return ViewSize(view: self, size: .width)
    }
}

@discardableResult public func == (lhs: ViewSize, rhs: ViewSize) -> ViewSize {
    guard let lhsView = lhs.view else {
        return lhs
    }
    
    if nil == rhs.view {
        Constraint.squarely(lhsView)
    }
    
    return lhs
}
