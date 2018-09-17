//
//  LoginView.swift
//  iOSTraning2018
//
//  Created by Thi Vo on 2018/9/14.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    public var loginView: LoginView! {
        guard isViewLoaded else { return nil }
        return view as! LoginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        isEnbale show password
//        textFiledPasswordClick.isSecureTextEntry = true
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loginView.textFiledEmail.text = "admin"
        self.loginView.textFilePassword.text = "123"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnHSignInClick(_ sender: Any) {
        if (loginView.textFiledEmail.text == "admin" && loginView.textFilePassword.text == "123") {
            
            let vc = ImageListViewController(nibName: "ImageListView", bundle: nil)
            let navb = UINavigationController(rootViewController: vc)            
            self.present(navb, animated: true, completion: nil)
        }
        else {
            // create the alert
            let alert = UIAlertController(title: "", message: "Email or Password incorrect", preferredStyle: UIAlertControllerStyle.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
