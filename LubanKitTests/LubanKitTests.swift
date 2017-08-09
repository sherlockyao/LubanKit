//
//  LubanKitTests.swift
//  LubanKitTests
//
//  Created by Sherlock Yao on 2017/8/2.
//  Copyright © 2017年 SherlockYao. All rights reserved.
//

import XCTest
@testable import LubanKit

class LubanKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
        let avatarImageView = UIView(frame: .zero)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(avatarImageView)
        let titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        let subtitleLabel = UILabel(frame: .zero)
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(subtitleLabel)
        
        lookinside(contentView) {
            horizontal {
                12 <-- avatarImageView.square(100) --- 8 --- titleLabel --> 12
                
                titleLabel.head == subtitleLabel.head
                titleLabel.tail == subtitleLabel.tail
            }
            
            vertical {
                titleLabel.space(21) --- 3 --- subtitleLabel.space(21)
                
                avatarImageView.middle == middleline
                avatarImageView.head == titleLabel.head
            }
        }
        
        contentView.setNeedsLayout()
        contentView.layoutIfNeeded()
        
        XCTAssertTrue(avatarImageView.frame == CGRect(x: 12, y: 100, width: 100, height: 100))
        XCTAssertTrue(titleLabel.frame == CGRect(x: 120, y: 100, width: 188, height: 21))
        XCTAssertTrue(subtitleLabel.frame == CGRect(x: 120, y: 124, width: 188, height: 21))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
