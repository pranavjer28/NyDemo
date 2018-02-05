//
//  NyServiceLayer.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 2/04/18..
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

let appsUrl = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/Movies/1.json?api-key=5edcb63665bf4614a2598b70f2d2c8cf"

class NewYorkServiceLayer: NSObject {

    let nySession:URLSession!
    let nySessionDataTask:URLSessionDataTask!
    var selectedArticle:String?=nil
    var selectedDuration:String?=nil
    
    override init(){
        nySession = URLSession(configuration: .default)
        nySessionDataTask = nil
        
    }
    
    func getArticleData(completion:@escaping(_:NSDictionary)->Void){
        
        let mostPopularArticleUrl = GlobalConstants.kNYMostPopularApi + selectedArticle! + "/" + selectedDuration! + ".json?" + "api-key=" + GlobalConstants.kAPiKey
        print("mostPopularArticleUrl ..... \(mostPopularArticleUrl)")
        
        let url = URL(string: mostPopularArticleUrl)!
        let dataTask = nySession.dataTask(with:url, completionHandler: { (responseData, response, responseError) in
            guard let data:Data = responseData,responseError == nil else{
                return
            }
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                completion(jsonResponse as! NSDictionary)
            }
            catch let error
            {
                print(error)
            }
        })
        dataTask.resume()
    }
}
