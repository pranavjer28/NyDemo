//
//  ArticleTestCase.swift
//  NyTimesArticleTestTests
//
//  Created by CognizantMcBook on 2/3/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import XCTest
@testable import NyTimesArticleTest

class ArticleTestCase: XCTestCase {

   var sessionUnderTest: URLSession!
    
    override func setUp() {
        super.setUp()
        sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testArticle(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ArticlesController") as! ArticlesController
        
    }
    
    func testGetArticleResponseCode() {
        let appsUrl1 = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/Arts/30.json?api-key=5edcb63665bf4614a2598b70f2d2c8cf"
       
        let url = URL(string: appsUrl1)
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        waitForExpectations(timeout: 5, handler: nil)
    }
}
