//
//  Margin.swift
//  LubanKit
//
//  Created by Sherlock Yao on 2017/8/7.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import Foundation

infix operator <-- : AssignmentPrecedence
infix operator --- : AssignmentPrecedence
infix operator --> : AssignmentPrecedence

public struct ViewSpacing {
    fileprivate let view: UIView
    fileprivate let space: Float
}
 
public func <-- (lhs: Float, rhs: UIView) {
    guard let containerView = container() else {
        return
    }
    Constraint.margin(rhs, left: lhs, to: containerView)
}

@discardableResult public func --- (lhs: UIView, rhs: ViewSpacing) -> UIView {
    if xaxis() {
        Constraint.append(rhs.view, after: lhs, distance: rhs.space)
    } else {
        Constraint.vappend(rhs.view, after: lhs, distance: rhs.space)
    }
    return lhs
}

@discardableResult public func --- (lhs: Float, rhs: UIView) -> ViewSpacing {
    return ViewSpacing(view: rhs, space: lhs)
}

@discardableResult public func --> (lhs: UIView, rhs: Float) -> UIView {
    guard let containerView = container() else {
        return lhs
    }
    Constraint.margin(lhs, right: rhs, to: containerView)
    return lhs
}

public extension UIView {
    
    public func space(_ pt: Float) -> UIView {
        if xaxis() {
            Constraint.fix(self, width: pt)
        } else {
            Constraint.fix(self, height: pt)
        }
        return self
    }
    
    public func square(_ pt: Float) -> UIView {
        Constraint.squarely(self)
        return self.space(pt)
    }
}
