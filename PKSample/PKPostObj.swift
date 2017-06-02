//
//  PKPostObj.swift
//  PKSample
//
//  Created by Uday Kumar Voleti on 22/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//
//

import UIKit

class PKPostObj {
    var title:String
    var titleId:String
    var userId:String
    var body:String
    
    init?(dict: Dictionary<String, Any>?) {
        
        if dict == nil {
            return nil
        }
        self.title = (dict?["title"])! as! String
        self.titleId = String(describing: dict?["id"])
        self.userId = String(describing: dict?["userId"])
        self.body = (dict?["body"]!)! as! String
    }
}
