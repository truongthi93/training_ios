//
//  UIImageViewExtension.swift
//  iOSTraning2018
//
//  Created by Thi Vo on 2018/9/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: .main, completionHandler: { (response, data, error) in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData as Data)
                }
            })
        }
    }
}
