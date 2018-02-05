//
//  SubOptionsViewController.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 2/04/18..
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

class SubOptionsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var timeOptionsTable: UITableView!
    let recentOptions = [1:"1 Day Ago", 7:"7 Day Ago", 30:"30 Day Ago"]
//    let recentOptions:[String] = ["1 Day Ago","7 Day Ago","30 Day Ago"]
    
    @IBOutlet weak var subOptionsTable: UITableView!
    var selectedTitle:String = ""
//    var selectedOptions=[String]()
    var selectedOptions:[String]?=nil
    var sortedKey:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        sortedKey = Array(recentOptions.keys).sorted(by: <)
        if(selectedTitle != nil){
            selectedOptions = [String]()
            selectedOptions!.append(selectedTitle)
            self.title = selectedTitle
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MRAK:- UITableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedKey.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "durationCell", for: indexPath)
        cell.textLabel!.text = recentOptions[sortedKey[indexPath.row]]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedOptions!.append(String(sortedKey[indexPath.row]))
        
        let articleList = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesController") as! ArticlesController
        
        if let optionsFound = selectedOptions{
            articleList.articleOptions = [String]()
              articleList.articleOptions! = optionsFound
        }
        self.navigationController?.pushViewController(articleList, animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier! == "articleDetail"{
            let destinationController = segue.destination as! ArticleDetailViewController
//            destinationController.selectedTitle = optionsArray[optionsTableView.indexPathForSelectedRow!.row]
        }
        
    }
 */


}
