//
//  PKPost.swift
//  PKSample
//
//  Created by Uday Kumar Voleti on 02/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

import UIKit

class PKPost: NSObject {
    var title:String?
    var titleId:String?
    var userId:String?
    var body:String?
    
    func mapping(dict: Dictionary<String,AnyObject>?) -> PKPost? {
        if let _ = dict {
            let postObj = PKPost()
            postObj.title = dict?[ResponseKeys.PostKeys.kTitleKey] as? String
            postObj.titleId = dict?[ResponseKeys.PostKeys.kTitleIdKey] as? String
            postObj.userId = dict?[ResponseKeys.PostKeys.kUserIdKey] as? String
            postObj.body = dict?[ResponseKeys.PostKeys.kBodyKey] as? String
            return postObj
        }
        else {
            return nil
        }
    }
}
