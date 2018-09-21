//
//  CRUDFile.swift
//  iOSTraning2018
//
//  Created by Bao Ngo Mau on 9/21/18.
//  Copyright © 2018 UIT. All rights reserved.
//

import UIKit

class CRUDFile{

    func DeleteFile(name: String) {
        // Create a FileManager instance
        let fileManager = FileManager.default
        
        // Delete 'hello.swift' file
        do {
            try fileManager.removeItem(atPath: name)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func WriteFile(fileName: String, text: String) {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
        let writePath = NSURL(fileURLWithPath: path)
        try? FileManager.default.createDirectory(atPath: writePath.path!, withIntermediateDirectories: true)
        let file = writePath.appendingPathComponent(fileName)
        try? text.write(to: file!, atomically: false, encoding: String.Encoding.utf8)
    }
    
    func ReadFile(fileName:String) -> String {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString
        let path = documentsPath.appendingPathComponent(fileName)
        let checkValidation = FileManager.default
        var file:String
        
        if checkValidation.fileExists(atPath: path) {
            do{
                try file = NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) as String
            }catch{
                file = ""
            }
        } else {
            file = ""
        }
        return file
    }
}
