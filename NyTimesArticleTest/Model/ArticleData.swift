//
//  ArticleData.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 1/22/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

enum Serilization:Error{
    case DataImproper
}


struct Media{
    let mediaType:String?
    let mediaSubType:String?
    let caption:String?
    let mediaCopyright:String?
    
    let mediaUrlDict:[String:String]?
}

struct ArticleData {

    let url:String?
    var adxKeywords:String?
    var section:String?
    var byLine:String?
    var type:String?
    var title:String?
    var abstract:String?
    var publishDate:String?
    var source:String?
    var mediaUrl:String?
    
    var mediaData:Media
    
    public init(data:[String:Any]) throws
    {
        guard let urlString1 = data["url"] as? String, let adxKeyword1 = data["adx_keywords"] as? String,
            let section1 = data["section"] as? String else{
                print("Some value is not proper")
                throw Serilization.DataImproper
            }
        
        guard let byLine1 = data["byline"] as? String, let type1 = data["type"] as? String, let tiltel1 = data["title"] as? String,
            let abstract1 = data["abstract"] as? String, let publishDate1 = data["published_date"] as? String, let source1 = data["source"] as? String else{
                throw Serilization.DataImproper
        }
        
        self.url = urlString1
        self.adxKeywords = adxKeyword1
        self.section = section1
        self.byLine = byLine1
        self.type = type1
        self.title = tiltel1
        self.abstract = abstract1
        self.publishDate = publishDate1
        self.source = source1
        
        let mediaArray = data["media"] as? [[String: Any]]
        let mediaDict = mediaArray![0]
        guard let mediaType = mediaDict["type"] as? String, let mediaSubType = mediaDict["subtype"] as? String, let copyright = mediaDict["copyright"] as? String,
            let caption1 = mediaDict["caption"] as? String else{
                throw Serilization.DataImproper
        }
        let metadataArray = mediaDict["media-metadata"] as? [[String:Any]]
        var tempDict:[String:String]=[:]
        for i in 0..<metadataArray!.count{
            let mediaUrl = metadataArray![i]["url"] as? String
            var mediaKey = ""
            switch(i){
                case 0:
                    mediaKey = "smallImage"
                case 1:
                    mediaKey = "mediumImage"
                case 2:
                    mediaKey = "largeImage"
                default:
                    mediaKey = "smallImage"
            }
            tempDict[mediaKey] = mediaUrl!
        }
        self.mediaData = Media(mediaType: mediaType, mediaSubType: mediaSubType, caption: caption1, mediaCopyright: copyright, mediaUrlDict:tempDict)
    }
}
