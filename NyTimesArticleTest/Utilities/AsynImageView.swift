//
//  AsynImageView.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 2/04/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

//enum ImageResponseError:Error{
//    case ImageDataNotFound,
////    case ImageDataImproper
//}


var asyncImageCacheArray = NSCache<NSString,UIImage>()

class AsynImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let imageUrlString:NSString?
    var session:URLSession!
    var downloadTask1:URLSessionDownloadTask!
   
    required init?(coder aDecoder: NSCoder) {
        self.imageUrlString = "placeholder"
        self.session = URLSession(configuration: .default)
        super.init(coder: aDecoder)
    }
    
    func loadImageFromUrl(url:String,placeholderImage:String,completion:@escaping(_:Bool)->Void){
        let imageUrl = url as? NSString
        if let image:UIImage = asyncImageCacheArray.object(forKey: imageUrl!){
            print("Cached image used, no need to download it")
            self.image = image
            completion(false)
        }else{
            print("Image is downloading from Server========");
            let articleImageUrl = URL(string: url)
            
            self.downloadTask1 = self.session.downloadTask(with: articleImageUrl!, completionHandler: { (url, responseData, error) in
                if let imageData = try? Data(contentsOf:url!)
                {
                    DispatchQueue.main.async {
                        let downloadedImage:UIImage! = UIImage(data:imageData)
                        self.image = downloadedImage!
                        asyncImageCacheArray.setObject(downloadedImage, forKey:imageUrl!)
                        completion(true)
                    }
                }
            })
            self.downloadTask1.resume()
        }
    }

}
