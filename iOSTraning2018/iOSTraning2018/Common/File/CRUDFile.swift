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
    
    func WriteFile(fileName: String, text: String) {
        // Set the file path
//        let path = "myfile.txt"
        // Set the contents
//        let contents = "Here are my file's contents"
        do {
            // Write contents to file
            try text.write(toFile: fileName, atomically: false, encoding: String.Encoding.utf8)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
    func ReadFile(fileName: String) {
        // Set the file path
//        let path = "myfile.txt"
        
        do {
            // Get the contents
            let contents = try NSString(contentsOfFile: fileName, encoding: String.Encoding.utf8.rawValue)
            print(contents)
        }
        catch let error as NSError {
            print("Ooops! Something went wrong: \(error)")
        }
    }
}
