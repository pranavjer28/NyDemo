//
//  ArticleTableViewCell.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 1/29/18.
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var aricleCellImage: AsynImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    var currentArticleData:ArticleData!
    var session:URLSession!
    var downloadTask:URLSessionDownloadTask!
    var cache:NSCache<AnyObject, AnyObject>!
    
    var cellTableView:UITableView!
    var cellImageUrl:String? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCellData(article:ArticleData, currentIndexPath:IndexPath ){
        self.titleLabel!.text = article.title!
        self.subTitleLabel!.text = article.title!
        self.cellImageUrl = article.mediaData.mediaUrlDict!["smallImage"]!
        self.aricleCellImage.sd_setImage(with: URL(string: self.cellImageUrl!), placeholderImage: UIImage(named: "placeholder.png"))
    }

    
    func roundedCorner(){
        self.aricleCellImage.layer.borderWidth = 1
        self.aricleCellImage.layer.masksToBounds = false
        self.aricleCellImage.layer.borderColor = UIColor.black.cgColor
        self.aricleCellImage.layer.cornerRadius = self.aricleCellImage.frame.height/2
        self.aricleCellImage.clipsToBounds = true
    }
    
}
