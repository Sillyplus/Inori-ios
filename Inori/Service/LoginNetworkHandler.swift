//
//  LoginNetworkHandler.swift
//  Inori
//
//  Created by silly on 12/11/15.
//  Copyright © 2015 silly. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginNetworkHandler: BaseNetworkHandler {
    
    class func userLogin(email: String, password: String, completion: (JSON) -> ()) {
        let parameters = [
            "email": "\(email)",
            "password": "\(password)",
        ]
        post("/login", para: parameters, completion: completion)
    }
    
}

