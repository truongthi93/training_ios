//
//  Constants.swift
//  iOSTraning2018
//
//  Created by Thi Vo on 2018/9/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class Constants{
    // Account
    static let correct_email = "admin"
    static let correct_password = "123"
    
    // ShowAlert
    static let showAlertLoginFail = "Email or Password incorrect"
    static let showAlertAPIFail = "Get data fail"
    static let showAlertDeleteImage = "Are you sure you want to delete this?"
    
    // Print
    static let showPrintSaveDataFail  = "Save data fail"
    
    // Title ShowAlert
    static let titleShowAlertMessage = "Message"
    static let buttonShowAlertOK = "OK"
    static let buttonShowAlertCancel = "Cancel"

    // String nil
    static let stringNil = ""
    
    // Name API
    static let nameDataAPI = "DataImage"
    static let nameDataAPILarge_url = "large_url"
    static let nameDataAPIUrl = "url"
    static let nameDataAPIId = "id"
    
    // Link API
    static let linkImage = "http://www.splashbase.co/api/v1/images/latest"
    
    // Nib name
    static let nameImageListView = "ImageListView"
    static let nameImageCollectionViewCell = "ImageCollectionViewCell"
    static let keyPathAlamofire = "images"
    
    // Screen title
    static let titleImageListView = "Image"
    static let titleUIRightBarButtonItem = "Logout"
    static let titleUILeftBarButtonItem = "Delete"

    // Name Image
    static let nameImageGoogle = "go"
    
    // Name UserDefault
    static let nameUserDefaultLoginEmail = "loginEmail"
    static let nameUserDefaultLoginPass = "loginPass"
    
    // File name
    static let fileNameCRUD = "UserPass.txt"
}
