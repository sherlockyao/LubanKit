//
//  LookinsideTests.swift
//  LubanKit
//
//  Created by Sherlock Yao on 2017/8/7.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import XCTest
@testable import LubanKit

class LookinsideTests: XCTestCase {
    
    func testStack() {
        let view = UIView()
        view.tag = 123
        let subview = UIView()
        subview.tag = 456
        
        lookinside(view) { 
            assert(123 == container()!.tag)
            
            lookinside(subview, block: { 
                assert(456 == container()!.tag)
            })
            
            assert(123 == container()!.tag)
        }
        
        assert(nil == container())
    }

}

