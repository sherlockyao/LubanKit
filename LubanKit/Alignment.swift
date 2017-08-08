//
//  Alignment.swift
//  LubanKit
//
//  Created by Sherlock Yao on 2017/8/7.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import Foundation

fileprivate enum Align {
    case none, left, top, right, bottom, centerX, centerY
    
    var attribute: NSLayoutAttribute {
        switch self {
        case .none:
            return .notAnAttribute
        case .left:
            return .leading
        case .top:
            return .top
        case .right:
            return .trailing
        case.bottom:
            return .bottom
        case .centerX:
            return .centerX
        case .centerY:
            return .centerY
        }
    }
}

public struct ViewAlignment {
    fileprivate let view: UIView?
    fileprivate let align: Align
}

public let middleline = ViewAlignment(view: nil, align: .none)

public extension UIView {
    
    public var head: ViewAlignment {
        return ViewAlignment(view: self, align: (xaxis() ? .left : .top))
    }
    
    public var tail: ViewAlignment {
        return ViewAlignment(view: self, align: (xaxis() ? .right : .bottom))
    }
    
    public var middle: ViewAlignment {
        return ViewAlignment(view: self, align: (xaxis() ? .centerX : .centerY))
    }
}

@discardableResult public func == (lhs: ViewAlignment, rhs: ViewAlignment) -> ViewAlignment {
    guard let view = lhs.view else {
        return lhs
    }
    let relatedView = rhs.view ?? (container() ?? view)
    let relatedAttribute = (nil == rhs.view) ? lhs.align.attribute : rhs.align.attribute;
    _ = Constraint.constrain(lhs.align.attribute, value: 0, on: view, to: relatedView, attribute: relatedAttribute)
    return lhs
}
