//
//  ArticleDetailTestCase.swift
//  NyTimesArticleTestTests
//
//  Created by CognizantMcBook on 2/4/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import XCTest

//@testable import NYTimesArticleTest
@testable import NyTimesArticleTest

class ArticleDetailTestCase: XCTestCase {
    var articleDetailController:ArticleDetailViewController?
    var articleListController : ArticlesController?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        self.articleDetailController = storyBoard.instantiateViewController(withIdentifier: "articleDetail") as? ArticleDetailViewController
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.articleDetailController = nil
        super.tearDown()
    }
    
    
    func testArticleViewLoads(){
        XCTAssertNotNil(self.articleDetailController!.view!, "View not intiated properly")
    }
    
  
    func testArticleDetailPresenet(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
         self.articleListController = storyBoard.instantiateViewController(withIdentifier: "ArticlesController") as?
        ArticlesController
        
        XCTAssertNotNil(self.articleListController!.view!, "View not intiated properly")
        
//        self.articleListController?.tableView((self.articleListController?.tableView)!, didSelectRowAt: IndexPath(row: 1, section: 0))
        
//        if detailController.selectedArticle?.title
        
//        guard let _ = detailController.selectedArticle?.title,let _ = detailController.selectedArticle?.byLine,let _ = detailController.selectedArticle?.publishDate else{
//            XCTFail("Detail Data Missing :")
//            return
//        }
        
        
    }
}
