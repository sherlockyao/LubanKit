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
            XCTAssertTrue(123 == container()!.tag)
            
            lookinside(subview) {
                XCTAssertTrue(456 == container()!.tag)
            }
            
            XCTAssertTrue(123 == container()!.tag)
        }
        
        XCTAssertTrue(nil == container())
    }
    
}

