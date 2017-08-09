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
    
    var attribute: NSLayoutAttribute {
        switch self {
        case .width:
            return .width
        case .height:
            return .height
        }
    }
}

public struct ViewSize {
    fileprivate let view: UIView
    fileprivate let size: Size
}

public extension UIView {
    
    public var width: ViewSize {
        return ViewSize(view: self, size: .width)
    }
    
    public var height: ViewSize {
        return ViewSize(view: self, size: .height)
    }
}

@discardableResult public func == (lhs: ViewSize, rhs: ViewSize) -> ViewSize {
    _ = Constraint.constrain(lhs.size.attribute, value: 0, on: lhs.view, to: rhs.view, attribute: rhs.size.attribute)
    return lhs
}
