//
//  PKNetworkManager.swift
//  PKSample
//
//  Created by Uday Kumar Voleti on 01/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

import UIKit

class PKNetworkManager: NSObject {
    static let sharedInstance = PKNetworkManager()
    
    private override init() {
        super.init()
    }
    
    func makeNetworkRequest(urlString: String, params:Dictionary<String,AnyObject>, completionHandler:@escaping ([String:Array<Any>]) -> ()) {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            let json = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
            let session = URLSession.shared
            let url = URL(string: urlString)
            
            var request = URLRequest(url: url!)
            request.httpMethod = NetworkConstants.GET_METHOD_TYPE
            request.setValue(NetworkConstants.CONTENT_TYPE_VALUE, forHTTPHeaderField: NetworkConstants.CONTENT_TYPE_KEY)
            request.setValue(NetworkConstants.ACCEPT_VALUE, forHTTPHeaderField:NetworkConstants.ACCEPT_KEY)
            request.setValue(NetworkConstants.X_REQUESTED_BY_VALUE, forHTTPHeaderField: NetworkConstants.X_REQUESTED_BY_KEY)
            request.httpBody = json.data(using: String.Encoding.utf8, allowLossyConversion: true)
            request.timeoutInterval = 60.0
            
            let dataTask = session.dataTask(with: request) { (data, response, error) -> Void in
                if error == nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? [String:AnyObject]
                        if jsonResponse != nil {
                            completionHandler(jsonResponse! as! [String : Array<Any>])
                        }
                        else {
                            let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? Array<AnyObject>
                            completionHandler(["result":(jsonResponse as AnyObject) as! Array<Any>])
                        }
                        
                    }
                    catch let exception {
                        print("Exception while parsing data: \(exception.localizedDescription)")
                    }
                }
                else {
                    print("Error: \(String(describing: error?.localizedDescription))")
                }
            }
            dataTask.resume()
        }
        catch let error {
            print("Error: \(error.localizedDescription)")
        }
        
    }

}
