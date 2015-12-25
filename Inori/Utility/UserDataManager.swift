//
//  userInfoManager.swift
//  mumengApp
//
//  Created by silly on 12/22/15.
//  Copyright © 2015 402. All rights reserved.
//

import Foundation
import SwiftyJSON

class UserDataManager {
    
    private class func getFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! String
        let path = documentsDirectory.stringByAppendingString("/UserData.plist")
        return path
    }
    
    private class func makeSureFileAtPath(path: String) {
        let fileManager = NSFileManager.defaultManager()
        if(!fileManager.fileExistsAtPath(path)) {
            // copy file from bundle
            if let bundlePath = NSBundle.mainBundle().pathForResource("UserData", ofType: "plist") {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
                print("Bundle UserData.plist file is --> \(resultDictionary?.description)")
                do {
                    try fileManager.copyItemAtPath(bundlePath, toPath: path)
                    print("copy file to path")
                } catch {
                    print("copy faild")
                }
            } else {
                print("UserData.plist not found. Please, make sure it is part of the bundle.")
            }
        } else {
            print("UserData.plist already exits at path.")
            // use this to delete file from documents directory
            //fileManager.removeItemAtPath(path, error: nil)
        }
        
    }
    
    class func readUserData(key: String) -> AnyObject {

        let path = getFilePath()
        makeSureFileAtPath(path)
        
        var output: AnyObject = ""
        
        if let dict = NSDictionary(contentsOfFile: path) {
            output = dict.objectForKey(key) as! String
            print("data_read")
            return output
        } else {
            print("WARNING: Couldn't create dictionary from \(path)!")
            output = ""
            return output
        }
    }
    
    class func writeUserData(key: String, data: AnyObject) {
        
        let path = getFilePath()
        makeSureFileAtPath(path)
        
        if let dict = NSMutableDictionary(contentsOfFile: path) {
            dict.setObject(data, forKey: key)
            if dict.writeToFile(path, atomically: true) {
                print("plist_write")
            } else {
                print("plist_write_error")
            }
        } else {
            print("WARNING: Couldn't create dictionary from \(path)!")
        }
    }
        
}