//
//  ViewController.swift
//  Inori
//
//  Created by silly on 12/4/15.
//  Copyright © 2015 silly. All rights reserved.
//

import UIKit

import Alamofire

class ViewController: UIViewController {

    @IBAction func testButttonTaped(sender: AnyObject) {
        Alamofire.request(.GET, "http://localhost:8000/professor/123").responseJSON { response in
            debugPrint(response)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

