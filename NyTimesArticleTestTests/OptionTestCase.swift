//
//  OptionTestCase.swift
//  NyTimesArticleTestTests
//
//  Created by CognizantMcBook on 2/3/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import XCTest
@testable import NyTimesArticleTest


class OptionTestCase: XCTestCase {

    var optionsController:OptionsListController? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.optionsController = storyBoard.instantiateViewController(withIdentifier: "OptionsListController") as? OptionsListController
    }
    override func tearDown() {
        super.tearDown()
        self.optionsController = nil
    }
    
    
    //MARK: View Loading Tests
    
    func testViewLoads(){
        XCTAssertNotNil(self.optionsController!.view, "View not intiated properly")
    }
    
    func testControllerHasTableViewSubview(){
        let subViewArray = self.optionsController?.view.subviews
        let tablePresent:Bool = subViewArray!.contains(self.optionsController!.optionsTableView)
        XCTAssertTrue(tablePresent, "TableView not present")
    }
    
//    func testTestViewLoads(){
//        XCTAssertNotNil(self.optionsController!.optionsTableView,"TableView Not Intiated")
//    }
    
    
    //MARK: UITableView Test
    func testThatViewConformsToUITableViewDataSource(){
        XCTAssertTrue(self.optionsController!.conforms(to: UITableViewDataSource.self), "View dosenot conform to table view protocol")
    }
    
    func testThatTableViewHasDataSource(){
        XCTAssertNotNil(self.optionsController!.optionsTableView.dataSource,"Table datasource cannot be nil");
    }
    
    
    func testThatViewConformsToUITableViewDelegate(){
        XCTAssertTrue(self.optionsController!.conforms(to: UITableViewDelegate.self), "View dosenot conform to table view delegate")
    }
    
    func testThatTableViewHasDelegate(){
        XCTAssertNotNil(self.optionsController!.optionsTableView.delegate,"Table delegate cannot be nil");
    }
    
   func testTableViewCellCreateCellsWithReuseIdentifier()
    {
        let subViewArray = self.optionsController?.view.subviews
        let tablePresent:Bool = subViewArray!.contains(self.optionsController!.optionsTableView)
        if(tablePresent){
            let cell: UITableViewCell = self.optionsController!.optionsTableView!.dequeueReusableCell(withIdentifier: "Cell")!
            XCTAssertNotNil(cell, "Cell Available")
        }
    }
    
    
    func testOption(){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "OptionsListController") as! OptionsListController
        _ = vc.optionsTableView
        
        let optionsArray:[String] = ["Arts","Books","Food","Health","Movies","Science","Sports","Technology"]
        XCTAssertEqual(optionsArray, vc.optionsArray)
    }
    
 

}
