//
//  UIViewController+UIKitUtilsTests.swift
//  
//
//  Created by 林博文 on 2022/2/8.
//

import XCTest
@testable import UIKitUtils

class UIViewControllerUIKitUtilsTests: XCTestCase {
    
    func testParent() {
        let parentController = UITableViewController()
        let controller = UIViewController()
        let childController = UIViewController()
        controller.addChild(childController)
        parentController.addChild(controller)
        XCTAssert(childController.parent(type: UITableViewController.self) == parentController)
    }
    
}
