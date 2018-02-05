//
//  ArticleDetailViewController.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 2/04/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var articleBigImage: AsynImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var articleAuthor: UILabel!
    @IBOutlet weak var publishDate: UILabel!
    var selectedArticle:ArticleData? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.articleTitle.text = selectedArticle!.title
        self.articleAuthor.text = "By \(selectedArticle!.byLine!)"
        self.publishDate.text = selectedArticle?.publishDate
        self.activityIndicator.startAnimating()
        if let largeMediaUrl = selectedArticle?.mediaData.mediaUrlDict!["largeImage"]{
            self.articleBigImage.loadImageFromUrl(url: largeMediaUrl, placeholderImage: "",completion:{isDownloaded in
                if(isDownloaded){
                    print("Detail Image downloaded")
                }
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidesWhenStopped = true
            })
        }else{
            print(".... No Url Found ....")
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
