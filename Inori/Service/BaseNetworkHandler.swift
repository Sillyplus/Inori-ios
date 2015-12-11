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
    static let host = "http://localhost:8000"
    
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
//        let successColsure = { (dataTask: NSURLSessionDataTask!, response: AnyObject!) -> Void in
//            let jsonError: NSErrorPointer = nil
//            let responseDict = response as! NSDictionary
//            let responseJSON: NSData?
//            do {
//                responseJSON = try NSJSONSerialization.dataWithJSONObject(response, options: NSJSONWritingOptions.PrettyPrinted)
//            } catch let error as NSError {
//                jsonError.memory = ErrorType
//                responseJSON = nil
//            } catch {
//                fatalError()
//            }
//            
//            let responseString = NSString(data: responseJSON!, encoding: NSUTF8StringEncoding)
//            print("The Response String is:\n \(responseString!)")
//            completion(responseDict as? [String: AnyObject])
//        }
//        
//        let failureColsure = { (dataTask: NSURLSessionDataTask!, error: NSError!) -> Void in
//            print("URLRequest Error: \(error)")
//            completion(nil)
//        }
        
        switch (method) {
        case .GET:
            shareManager().request(.GET, url, parameters: para, encoding: .JSON, headers: nil)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .Success(let value):
                        print("Success value: \(value)")
                        completion(value as? [String : AnyObject])
                    case .Failure(let error):
                        print("Faliure error: \(error)")
                    }
                }
//        case .POST:
//        case .PUT:
//        case .DELETE:
        default:
            print("Not GET Method")
        }
    }
}