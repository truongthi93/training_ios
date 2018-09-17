//
//  LoginPassViewController.swift
//  iOSTraning2018
//
//  Created by Bao Ngo Mau on 9/17/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ImageListViewController: UIViewController {
    public var imageListView: ImageListView! {
        guard isViewLoaded else { return nil }
        return view as! ImageListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Images"
        
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(ImageListViewController.logout))
//        let logout = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(LoginPassViewController.logout))
        self.navigationItem.rightBarButtonItem  = logout
        
        self.getImageFromAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func logout() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getImageFromAPI() {
        let URL = "http://www.splashbase.co/api/v1/images/latest"
        Alamofire.request(URL, method:.get).responseJSON(completionHandler: { (json) in
            print(json)
//            let forecastArray = response.result.value
//            
//            if let forecastArray = forecastArray {
//                for forecast in forecastArray {
//                    print(forecast.day)
//                    print(forecast.temperature)
//                }
//            }
        })
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
