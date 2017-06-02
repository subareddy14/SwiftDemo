//
//  PKConstants.swift
//  PKSample
//
//  Created by Uday Kumar Voleti on 01/05/17.
//  Copyright © 2017 Prokarma. All rights reserved.
//

import Foundation

struct NetworkConstants {
    // REQUEST KEYS
    static let GET_METHOD_TYPE = "GET"
    static let POST_METHOD_TYPE = "POST"
    static let CONTENT_TYPE_KEY = "Content-Type"
    static let CONTENT_TYPE_VALUE = "application/json"
    static let ACCEPT_KEY = "Accept"
    static let ACCEPT_VALUE = "application/json,multipart/form-data"
    static let X_REQUESTED_BY_KEY = "X-Requested-By"
    static let X_REQUESTED_BY_VALUE = "MYATT"
    
    // RESPONSE KEYS
    static let RESULT_KEY = "Result"
    static let STATUS_KEY = "Status"
    static let STATUS_SUCCESS_VALUE = "SUCCESS"
    static let MESSAGES_KEY = "Messages"
    static let TITLE_KEY = "EnglishTitle"
    static let SHORT_MESSAGE_KEY = "EnglishShortMessage"
    static let ERROR_KEY = "Error"
    static let ERROR_TITLE_KEY = "ErrorTitle"
    static let ERROR_MESSAGE_KEY = "ErrorMessage"
}
