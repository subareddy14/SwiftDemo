//
//  ViewController.swift
//  PKSample
//
//  Created by Uday Kumar Voleti on 01/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    //MARK: Properties
    
    @IBOutlet weak var tableView: UITableView!
    var postsArr = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 72.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        PKNetworkManager.sharedInstance.makeNetworkRequest(urlString: "https://jsonplaceholder.typicode.com/posts", params: [:]) {[weak self](responseDict) in
            
            if responseDict[NetworkConstants.ERROR_KEY] == nil {
                for dictObj in responseDict["result"]! {
                    let postObj = PKPostObj(dict: dictObj as? Dictionary<String, Any>)
                    if postObj != nil {
                       self?.postsArr.append(postObj!)
                    }
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postsArr.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PKPostTableViewCell", for: indexPath) as! PKPostTableViewCell
        let postObj = postsArr[indexPath.row] as! PKPostObj
        cell.configureCell(postObj: postObj)
        return cell
    }

}

