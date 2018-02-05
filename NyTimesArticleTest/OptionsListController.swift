//
//  OptionsListController.swift
//  NyTimesArticleTest
//
//  Created by CognizantMcBook on 2/04/18..
//  Copyright © 2018 CognizantMcBook. All rights reserved.
//

import UIKit

class OptionsListController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var optionsTableView: UITableView!
    
    let optionsArray:[String] = ["Arts","Books","Food","Health","Movies","Science","Sports","Technology"]
    var selectedArticle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UITableView Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return optionsArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel!.text = optionsArray[indexPath.row]
        
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier! == "subOptionSegue"{
            let destinationController = segue.destination as! SubOptionsViewController
            destinationController.selectedTitle = optionsArray[optionsTableView.indexPathForSelectedRow!.row]
        }
    }

    

}
