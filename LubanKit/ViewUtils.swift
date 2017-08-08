//
//  ViewUtils.swift
//  Cartography
//
//  Created by Garth Snyder on 11/23/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

internal func closestCommonAncestor(_ a: UIView, _ b: UIView) -> UIView? {
    let (aSuper, bSuper) = (a.superview, b.superview)

    if a === b { return a }

    if a === bSuper { return a }

    if b === aSuper { return b }

    if aSuper === bSuper { return aSuper }

    let ancestorsOfA = Set(ancestors(a))

    for ancestor in ancestors(b) {
        if ancestorsOfA.contains(ancestor) {
            return ancestor
        }
    }

    return .none
}

private func ancestors(_ v: UIView) -> AnySequence<UIView> {
    return AnySequence { () -> AnyIterator<UIView> in
        var view: UIView? = v
        return AnyIterator {
            let current = view
            view = view?.superview
            return current
        }
    }
}
