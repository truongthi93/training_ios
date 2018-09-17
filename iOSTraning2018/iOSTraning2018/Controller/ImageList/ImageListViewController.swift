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
import AlamofireObjectMapper

class ImageListViewController: UIViewController {
    
    public var imageListView: ImageListView! {
        guard isViewLoaded else { return nil }
        return view as! ImageListView
    }
    var imageList : [SplashbaseImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageListView.collectionView.delegate = self
        self.imageListView.collectionView.dataSource = self

        self.navigationItem.title = "Images"
        
        let logout = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(ImageListViewController.logout))
        self.navigationItem.rightBarButtonItem  = logout
        
        imageListView.collectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")

        self.getImageFromAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func logout() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getImageFromAPI() {
        let URL = "http://www.splashbase.co/api/v1/images/latest"
        
        Alamofire.request(URL).responseArray(keyPath: "images") { (response: DataResponse<[SplashbaseImage]>) in
            
            let forecastArray = response.result.value
            
            if let forecastArray = forecastArray {
                self.imageList = forecastArray
                self.imageListView.collectionView.reloadData()
            }
        }
    }
}

// MARK:- UICollectionView DataSource
extension ImageListViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell",for:indexPath as IndexPath) as! ImageCollectionViewCell
        if let image = imageList[indexPath.row].url {
            cell.imageView.imageFromUrl(urlString: image)
        }
        
        return cell
    }
}

// MARK:- UICollectionViewDelegate Methods
extension ImageListViewController : UICollectionViewDelegate {
    
    private func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
    }
    
    private func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: IndexPath) {
    }
}

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
