//
//  LoginNetworkHandler.swift
//  Inori
//
//  Created by silly on 12/11/15.
//  Copyright © 2015 silly. All rights reserved.
//

import Foundation
import Alamofire

class LoginNetworkHandler: BaseNetworkHandler {
    
    class func userLogin(email: String, password: String, completion: ([String: AnyObject]?) -> ()) {
        getJSONData("/professor/123", completion: completion)
    }
    
}

