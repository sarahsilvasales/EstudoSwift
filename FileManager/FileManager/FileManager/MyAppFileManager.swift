//
//  MyAppFileManager.swift
//  FileManager
//
//  Created by projeto smart on 30/06/23.
//

import SwiftUI

class MyAppFileManager {
    let manager: FileManager
    let managerDirectory: FileManager.SearchPathDirectory
    let managerDomainMask: FileManager.SearchPathDomainMask
    
    init(manager: FileManager, managerDirectory: FileManager.SearchPathDirectory, managerDomainMask: FileManager.SearchPathDomainMask) {
        self.manager = manager
        self.managerDirectory = managerDirectory
        self.managerDomainMask = managerDomainMask
    }
    
    init() {
        self.manager = FileManager.default
        self.managerDirectory = FileManager.SearchPathDirectory.documentDirectory
        self.managerDomainMask = FileManager.SearchPathDomainMask.userDomainMask
    }
    
    //MARK: Take Main Directory URL
    func takeMainDirectoryURL(addPath: String, myFile: MyFile) -> URL? {
        let mainURLDirectory = manager.urls(for: managerDirectory, in: managerDomainMask).first
        
        let addPathURL = mainURLDirectory?.appendingPathComponent(addPath)
        
        if myFile.fileName.isEmpty {
            return addPathURL
        } else if myFile.fileExtension.isEmpty {
            let fileNameURL = addPathURL?.appendingPathComponent(myFile.fileName)
            return fileNameURL
        } else {
            let fullURL = addPathURL?.appendingPathComponent(myFile.fileName + "." + myFile.fileExtension)
            return fullURL
        }
    }
    
    //MARK: Print Main Directory
    func printMainDirectory(addPath: String, myFile: MyFile) {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return
        }
        print("Main URL: \(mainURL)")
    }
    
    //MARK: Create New Directory
    func createNewDirectory(addPath: String, myFile: MyFile) {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return
        }
        let path = mainURL.path
        
        do {
            try manager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print("Error Description: \(error.localizedDescription)")
        }
    }
    
    //MARK: Delete Item In Directory
    func deleteItemInDirectory(addPath: String, myFile: MyFile) {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return
        }
        let path = mainURL.path
        
        if manager.fileExists(atPath: path) {
            do {
                try manager.removeItem(atPath: path)
            } catch let error {
                print("Error Description: \(error.localizedDescription)")
            }
        } else {
            print("Can't found file")
        }
    }
    
    
    //MARK: CreateNewFile
    func createNewFile(addPath: String, myFile: MyFile) {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return
        }
        
        let path = mainURL.path
        
        manager.createFile(atPath: path, contents: nil, attributes: nil)
    }
    
    //MARK: Create New File with Text
    func createNewFileWithText(addPath: String, myFile: MyFile) {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return
        }
        
        let path = mainURL.path
        
        guard let contentData = myFile.textForFile.data(using: .utf8) else {
            return
        }
        
        manager.createFile(atPath: path, contents: contentData)
    }
    
    //MARK: Take File with Text
    func takeFileWithText(addPath: String, myFile: MyFile) -> String {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return ""
        }
        
        let path = mainURL.path
        
        if manager.fileExists(atPath: path) {
            do {
                let text = try String(contentsOf: mainURL)
                return text
            } catch let error {
                print("Error Description: \(error.localizedDescription)")
                return "Error"
            }
        } else {
            return "File don't exists"
        }
        
//        return "Error"
    }
    
    
    //MARK: Save JSON Object
    func saveJSONObject(addPath: String, myFile: MyFile, appContent: [Laptop]) {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return
        }
        
        let path = mainURL.path
        
        do {
            let encodedData = try JSONEncoder().encode(appContent)
            manager.createFile(atPath: path, contents: encodedData)
        } catch let error {
            print("Error Description: \(error.localizedDescription)")
        }
    }
    
    //MARK: Take Back JSON File
    func takeBackJSONObject(addPath: String, myFile: MyFile) -> [Laptop] {
        guard let mainURL = takeMainDirectoryURL(addPath: addPath, myFile: myFile) else {
            return [Laptop]()
        }
        
        let path = mainURL.path
        
        if manager.fileExists(atPath: path) {
            do {
                let jsonData = try Data(contentsOf: mainURL)
                
                let laptopList = try JSONDecoder().decode([Laptop].self, from: jsonData)
                return laptopList
            } catch let error {
                print("Error Description: \(error.localizedDescription)")
            }
        }
        
        return [Laptop]()
    }
}
