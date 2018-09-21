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
        
            let returnValueEmail: String = UserDefaults.standard.string(forKey: Constants.nameUserDefaultLoginEmail) ?? ""
            let returnValuePass: String = UserDefaults.standard.string(forKey: Constants.nameUserDefaultLoginPass) ?? ""

            loginView.textFiledEmail.text = returnValueEmail
            loginView.textFilePassword.text = returnValuePass
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
            UserDefaults.standard.setValue(loginView.textFiledEmail.text, forKey: Constants.nameUserDefaultLoginEmail)
            UserDefaults.standard.setValue(loginView.textFilePassword.text, forKey: Constants.nameUserDefaultLoginPass)
            
            CRUDFile().WriteFile(fileName: "UserPass.txt",text: (loginView.textFiledEmail.text ?? "") + (loginView.textFilePassword.text ?? ""))

            let a = CRUDFile().ReadFile(fileName: "UserPass.txt")
            print(a)
            
            let vc = ImageListViewController(nibName: Constants.nameImageListView, bundle: nil)
            let navb = UINavigationController(rootViewController: vc)            
            self.present(navb, animated: true, completion: nil)
        }
        else {
            Utility.showAlert(message: Constants.showAletLoginFail, context: self)
        }
    }
}

