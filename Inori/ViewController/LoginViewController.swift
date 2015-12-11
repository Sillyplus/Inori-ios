//
//  LoginViewController.swift
//  Inori
//
//  Created by silly on 12/11/15.
//  Copyright © 2015 silly. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    @IBAction func pressLoginButton(sender: AnyObject) {
        LoginNetworkHandler.userLogin(emailTF.text!, password: passwordTF.text!, completion: { (result) -> () in
            print("complete login")
            self.performSegueWithIdentifier("presentPersonalDetail", sender: sender)
        })

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
