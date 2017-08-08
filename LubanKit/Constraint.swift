//
//  Constraint.swift
//  LubanKit
//
//  Created by Sherlock Yao on 2017/8/8.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import Foundation

internal struct Constraint {

    @discardableResult static func squarely(_ view: UIView) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
        view.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult static func fix(_ view: UIView, width: Float) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: CGFloat(width))
        view.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult static func fix(_ view: UIView, height: Float) -> NSLayoutConstraint {
        let constraint = NSLayoutConstraint(item: view, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 0, constant: CGFloat(height))
        view.addConstraint(constraint)
        return constraint
    }
    
    @discardableResult static func margin(_ view: UIView, left constant: Float, to box: UIView) -> NSLayoutConstraint? {
        return constrain(.leading, value:constant, on:view, to:box)
    }
    
    @discardableResult static func margin(_ view: UIView, right constant: Float, to box: UIView) -> NSLayoutConstraint? {
        return constrain(.trailing, value:constant, on:box, to:view)
    }
    
    @discardableResult static func margin(_ view: UIView, top constant: Float, to box: UIView) -> NSLayoutConstraint? {
         return constrain(.top, value:constant, on:view, to:box)
    }
    
    @discardableResult static func margin(_ view: UIView, bottom constant: Float, to box: UIView) -> NSLayoutConstraint? {
        return constrain(.bottom, value:constant, on:box, to:view)
    }
    
    @discardableResult static func append(_ view: UIView, after head: UIView, distance constant: Float) -> NSLayoutConstraint? {
        return constrain(.leading, value:constant, on:view, to:head, attribute:.trailing)
    }
    
    @discardableResult static func vappend(_ view: UIView, after head: UIView, distance constant: Float) -> NSLayoutConstraint? {
        return constrain(.top, value:constant, on:view, to:head, attribute:.bottom)
    }
    
    @discardableResult static func center(_ view: UIView, to relatedView: UIView) -> NSLayoutConstraint? {
        return constrain(.centerX, value:0, on:view, to:relatedView)
    }
    
    @discardableResult static func vcenter(_ view: UIView, to relatedView: UIView) -> NSLayoutConstraint? {
        return constrain(.centerY, value:0, on:view, to:relatedView)
    }
    
    static func constrain(_ attribute: NSLayoutAttribute, value: Float, on a: UIView, to b: UIView) -> NSLayoutConstraint? {
        guard let common = closestCommonAncestor(a, b) else {
            return nil
        }
        
        let constraint = NSLayoutConstraint(item: a, attribute: attribute, relatedBy: .equal, toItem: b, attribute: attribute, multiplier: 1, constant: CGFloat(value))
        common.addConstraint(constraint)
        return constraint
    }
    
    static func constrain(_ attribute: NSLayoutAttribute, value: Float, on a: UIView, to b: UIView, attribute relatedAttribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        guard let common = closestCommonAncestor(a, b) else {
            return nil
        }
        
        let constraint = NSLayoutConstraint(item: a, attribute: attribute, relatedBy: .equal, toItem: b, attribute: relatedAttribute, multiplier: 1, constant: CGFloat(value))
        common.addConstraint(constraint)
        return constraint
    }
    
    
}
