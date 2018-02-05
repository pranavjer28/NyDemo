//
//  SubOptionTestCase.swift
//  NyTimesArticleTestTests
//
//  Created by CognizantMcBook on 2/5/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import XCTest

@testable import NyTimesArticleTest

class SubOptionTestCase: XCTestCase {
    
    var subOptionsController:SubOptionsViewController? = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.subOptionsController = storyBoard.instantiateViewController(withIdentifier: "SubOptionsViewController") as? SubOptionsViewController
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.subOptionsController = nil
    }
    
    
    
    func testViewLoads(){
        XCTAssertNotNil(self.subOptionsController!.view, "View not intiated properly")
    }
    
    func testControllerHasTableViewSubview(){
        let subViewArray = self.subOptionsController?.view.subviews
        let tablePresent:Bool = subViewArray!.contains(self.subOptionsController!.timeOptionsTable)
        XCTAssertTrue(tablePresent, "TableView not present")
    }
    
    //    func testTestViewLoads(){
    //        XCTAssertNotNil(self.optionsController!.optionsTableView,"TableView Not Intiated")
    //    }
    
    
    //MARK: UITableView Test
    func testThatViewConformsToUITableViewDataSource(){
        XCTAssertTrue(self.subOptionsController!.conforms(to: UITableViewDataSource.self), "View dosenot conform to table view protocol")
    }
    
    func testThatTableViewHasDataSource(){
        XCTAssertNotNil(self.subOptionsController!.timeOptionsTable.dataSource,"Table datasource cannot be nil");
    }
    
    
    func testThatViewConformsToUITableViewDelegate(){
        XCTAssertTrue(self.subOptionsController!.conforms(to: UITableViewDelegate.self), "View dosenot conform to table view delegate")
    }
    
    func testThatTableViewHasDelegate(){
        XCTAssertNotNil(self.subOptionsController!.timeOptionsTable.delegate,"Table delegate cannot be nil");
    }
    
    func testTableViewCellCreateCellsWithReuseIdentifier()
    {
        let subViewArray = self.subOptionsController?.view.subviews
        let tablePresent:Bool = subViewArray!.contains(self.subOptionsController!.timeOptionsTable)
        if(tablePresent){
            let cell: UITableViewCell = self.subOptionsController!.timeOptionsTable!.dequeueReusableCell(withIdentifier: "durationCell")!
            XCTAssertNotNil(cell, "Cell Available")
        }
    }
    
    
//    func testOption(){
//        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyBoard.instantiateViewController(withIdentifier:"SubOptionsViewController") as! SubOptionsViewController
//        _ = vc.timeOptionsTable
//
//        let optionsArray:[String] = ["1 Day Ago","7 Day Ago","30 Day Ago"]
//        XCTAssertEqual(optionsArray, vc.sortedKey)
//    }
    
    
}
