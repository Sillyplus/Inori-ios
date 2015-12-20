//
//  BaseNetworkHandler.swift
//  Inori
//
//  Created by silly on 12/11/15.
//  Copyright © 2015 silly. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethod {
    case GET
    case PUT
    case POST
    case DELETE
}

class BaseNetworkHandler: NSObject {
    static let host = "http://localhost:8080"
    
    class func getJSONData(path: String, completion: ([String: AnyObject]?) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: nil, method: .GET, completion: completion)
    }
    
    class func postTo(path: String, para: [String: AnyObject], completion: ([String: AnyObject]?) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: para, method: .POST, completion: completion)
    }
    
    class func putTo(path: String, para: [String: AnyObject], completion: ([String: AnyObject]?) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: para, method: .PUT, completion: completion)
    }
    
    class func deleteData(path: String, para: [String: AnyObject], completion: ([String: AnyObject]?) -> ()) {
        let urlString = host.stringByAppendingString(path)
        self.doHTTPRequest(urlString, para: para, method: .DELETE, completion: completion)
    }
    
    // MARK: Private Method
    private class func shareManager() -> Alamofire.Manager {
        struct Singleton {
            static let instance = Alamofire.Manager.sharedInstance
        }
        return Singleton.instance
    }
    
    private class func doHTTPRequest(url: String, para: [String: AnyObject]?, method: HTTPMethod, completion: ([String: AnyObject]?)->()) {

        switch (method) {
        case .GET:
            shareManager().request(.GET, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON(completionHandler: { (response) -> Void in
                    print("response: \(response)")
                    
                    switch response.result {
                    case .Success(let value):
                        print("Success value: \(value)")
                        completion(value as? [String : AnyObject])
                    case .Failure(let error):
                        print("Failure error: \(error)")
                    }
                    
                })
        case .POST:
            shareManager().request(.POST, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON(completionHandler: { (response) -> Void in
                    print("call post")
                    switch response.result {
                    case .Success(let value):
                        print("Success value: \(value)")
                        completion(value as? [String : AnyObject])
                    case .Failure(let error):
                        print("Failure error: \(error)")
                    }
                })
//        case .PUT:
//        case .DELETE:
        default:
            print("Not GET Method")
        }
    }
}