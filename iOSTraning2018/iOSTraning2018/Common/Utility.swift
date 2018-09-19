//
//  Utility.swift
//  iOSTraning2018
//
//  Created by Thi Vo on 2018/9/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class Utility {
    class func showAlert(message: String, context: UIViewController) {
    // create the alert
    let alert = UIAlertController(title: Constants.titleShowAletMessage, message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    // add an action (button)
    alert.addAction(UIAlertAction(title: Constants.buttonShowAletOK, style: UIAlertActionStyle.default, handler: nil))
    
    // show the alert
    context.present(alert, animated: true, completion: nil)
    }
}
