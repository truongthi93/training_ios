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
        //Todo: Get userdefault email and password

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnHSignInClick(_ sender: Any) {
        if (loginView.textFiledEmail.text == Constants.correct_email && loginView.textFilePassword.text == Constants.correct_password) {
            // Todo: Save to userdefault email and password
            let vc = ImageListViewController(nibName: "ImageListView", bundle: nil)
            let navb = UINavigationController(rootViewController: vc)            
            self.present(navb, animated: true, completion: nil)
        }
        else {
            Utility.showAlert(message: "Email or Password incorrect", context: self)
        }
    }
}
