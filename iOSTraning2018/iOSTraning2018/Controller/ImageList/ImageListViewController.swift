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

        self.setUpNavigationBar()
        
        imageListView.collectionView.register(UINib.init(nibName: Constants.nameImageCollectionViewCell , bundle: nil), forCellWithReuseIdentifier: Constants.nameImageCollectionViewCell)

        if let fetchData = CoreDataImage.shared.fetchData(),
            fetchData.count > 0{
            self.imageList = fetchData
            self.imageListView.collectionView.reloadData()
        } else {
            self.getImageFromAPI { (success) in
                if success {
                    self.imageListView.collectionView.reloadData()
                } else {
                    Utility.showAlert(message: Constants.showAletAPIFail, context: self)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setUpNavigationBar() {
        self.navigationItem.title = Constants.titleImageListView
        let logout = UIBarButtonItem(title: Constants.titleUIRightBarButtonItem, style: .plain, target: self, action: #selector(ImageListViewController.logout))
        self.navigationItem.rightBarButtonItem  = logout
        
        self.navigationItem.title = Constants.titleImageListView
        let delete = UIBarButtonItem(title: Constants.titleUILeftBarButtonItem, style: .plain, target: self, action: #selector(ImageListViewController.deleteAllLocal))
        self.navigationItem.leftBarButtonItem  = delete
    }
    
    @objc func logout() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func deleteAllLocal() {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            CoreDataImage.shared.deleteData()
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        self.present(dialogMessage, animated: true, completion: nil)
        
    }

    func getImageFromAPI(completion: @escaping (_ result: Bool) -> Void) {
        let URL = Constants.linkImage
        let sv = UIViewController.displaySpinner(onView: self.view)
        Alamofire.request(URL).responseArray(keyPath: Constants.keyPathAlamofire) { (response: DataResponse<[SplashbaseImage]>) in
            let forecastArray = response.result.value
            if let forecastArray = forecastArray {
                self.imageList = forecastArray
                // Save to database
                CoreDataImage.shared.saveData(list: forecastArray)
                completion(true)
            } else {
                completion(false)
            }
            
            UIViewController.removeSpinner(spinner: sv)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.nameImageCollectionViewCell,for:indexPath as IndexPath) as! ImageCollectionViewCell
        if let image = imageList[indexPath.row].url {
            cell.imageView.imageFromUrl(urlString: image)
        } else {
            cell.imageView.image = UIImage(named: Constants.nameImageGoogle)
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
