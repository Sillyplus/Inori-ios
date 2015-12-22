//
//  BaseNetworkHandler.swift
//  Inori
//
//  Created by silly on 12/11/15.
//  Copyright © 2015 silly. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum HTTPMethod {
    case GET
    case PUT
    case POST
    case DELETE
}

class BaseNetworkHandler: NSObject {
    static let host = "http://localhost:8080"
    
    class func get(path: String, completion: (JSON) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: nil, method: .GET, completion: completion)
    }
    
    class func post(path: String, para: [String: AnyObject], completion: (JSON) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: para, method: .POST, completion: completion)
    }
    
    class func put(path: String, para: [String: AnyObject], completion: (JSON) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: para, method: .PUT, completion: completion)
    }
    
    class func delete(path: String, para: [String: AnyObject], completion: (JSON) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: para, method: .DELETE, completion: completion)
    }
    
    // MARK: Private Method
    
    private class func doHTTPRequest(url: String, para: [String: AnyObject]?, method: HTTPMethod, completion: (JSON)->()) {

        switch (method) {
        case .GET:
            request(.GET, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON(completionHandler: { (response) -> Void in
                    print("response: \(response)")
                    switch response.result {
                    case .Success(let value):
                        completion(JSON(value))
                    case .Failure(let error):
                        print("Failure error: \(error)")
                    }
                    
                })
            
        case .POST:
            request(.POST, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON(completionHandler: { (response) -> Void in
                    switch response.result {
                    case .Success(let value):
                        completion(JSON(value))
                    case .Failure(let error):
                        print("Failure error: \(error)")
                    }
                })
            
        case .PUT:
            request(.PUT, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON(completionHandler: { (response) -> Void in
                    switch response.result {
                    case .Success(let value):
                        completion(JSON(value))
                    case .Failure(let error):
                        print("Failure error: \(error)")
                    }
                })

        case .DELETE:
            request(.DELETE, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON(completionHandler: { (response) -> Void in
                    switch response.result {
                    case .Success(let value):
                        completion(JSON(value))
                    case .Failure(let error):
                        print("Failure error: \(error)")
                    }
                })
            
        }
    }
}