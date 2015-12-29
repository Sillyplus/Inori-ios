//
//  LoginViewController.swift
//  Inori
//
//  Created by silly on 12/11/15.
//  Copyright © 2015 silly. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBAction func pressLoginButton(sender: AnyObject) {
        LoginNetworkHandler.userLogin(emailTF.text!, password: passwordTF.text!, completion: { (result) -> () in
            print("\(result)")
            
            if result["stat"] == "1" {
                self.performSegueWithIdentifier("presentPersonalDetail", sender: sender)
            } else {
                let msg = result["msg"].stringValue
                let alert = UIAlertController(title: "Error", message: msg, preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }

        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.text = "inori@inori.com"
        passwordTF.text = "31415!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
