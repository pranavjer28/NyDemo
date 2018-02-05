//
//  ArticlesController.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 2/04/18..
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

enum ResponseDataError{
    case DataNotProper
    case DataNotFound
}

class ArticlesController: UITableViewController {

    var articlesList:[ArticleData]? = []
    weak var activityIndicatorView: UIActivityIndicatorView!
    var articleOptions:[String]?=nil
    
    @IBOutlet weak var loaderLabel: UILabel!
//    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    var chooseArticle : ArticleData? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 620
//        self.tableView.isHidden = true
//        self.view.backgroundColor = UIColor.white

        let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        tableView.backgroundView = activityIndicatorView
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.activityIndicatorView = activityIndicatorView
        self.activityIndicatorView.startAnimating()
        
        let nyService = NewYorkServiceLayer()
        if let article = self.articleOptions?[0]{
            nyService.selectedArticle = article
        }
        if let timeDuration  = self.articleOptions?[1]{
            nyService.selectedDuration = timeDuration
        }
        nyService.getArticleData { (dataDict:NSDictionary) in
            let results = dataDict["results"] as? [[String:Any]]
            do{
                for i in 0..<results!.count{
                    let article = try ArticleData(data:results![i])
                    self.articlesList!.append(article)
                }
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.tableView.reloadData()
                }
                
                if (results?.count == 0){
                    self.showAlert(errorType:ResponseDataError.DataNotFound)
                }
                
            }
            catch let error{
                print("Error....  \(error)")
                DispatchQueue.main.async {
                    self.activityIndicatorView.stopAnimating()
                    self.showAlert(errorType:ResponseDataError.DataNotProper)
                }
            }
        }
    }

    
    func showAlert(errorType:ResponseDataError){
        
        var alertTitle = ""
        var alertMessage = ""
        switch errorType {
        case ResponseDataError.DataNotProper:
            print(",,,,")
            alertTitle = GlobalConstants.errorTitle1
            alertMessage = GlobalConstants.errorMessage1
        case ResponseDataError.DataNotFound:
            print(",,,,")
            alertTitle = GlobalConstants.errorTitle
            alertMessage = GlobalConstants.errorMessage
        }
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        self.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            switch action.style{
            case .default:
                self.navigationController?.popViewController(animated: true)
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            }}))
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.articlesList!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let articleCell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as! ArticleTableViewCell
        articleCell.currentArticleData = articlesList![indexPath.row]
        articleCell.cellTableView = self.tableView
        articleCell.roundedCorner()
        articleCell.setCellData(article: articlesList![indexPath.row] , currentIndexPath: indexPath)
        return articleCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chooseArticle = articlesList![indexPath.row]
        let articleDetailCtrl = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "articleDetail") as! ArticleDetailViewController
        articleDetailCtrl.selectedArticle = self.chooseArticle
        self.navigationController?.pushViewController(articleDetailCtrl, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
