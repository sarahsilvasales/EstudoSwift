//
//  MyAppViewModel.swift
//  FileManager
//
//  Created by projeto smart on 30/06/23.
//

import SwiftUI

class MyAppViewModel: ObservableObject {

    @Published var newFile: MyFile
    @Published var selectedFile: MyFile
    @Published var additionPath: String
    @Published var newLaptop: Laptop
    @Published var allLaptop: [Laptop]
    
    let myAppFileManager = MyAppFileManager()
    
    init(newFile: MyFile, selectedFile: MyFile, additionPath: String, newLaptop: Laptop, allLaptop: [Laptop]) {
        self.newFile = newFile
        self.selectedFile = selectedFile
        self.additionPath = additionPath
        self.newLaptop = newLaptop
        self.allLaptop = allLaptop
    }
    
    init() {
        newFile = MyFile(fileName: "", fileExtension: "", textForFile: "", image: nil, typeOfFile: "")
        selectedFile = MyFile(fileName: "", fileExtension: "", textForFile: "", image: nil, typeOfFile: "")
        additionPath = ""
        newLaptop = Laptop(name: "", releaseData: "", color: "")
        allLaptop = [Laptop]()
    }
    
    //MARK: Print Main Directory
    func printMainDirectory() {
        myAppFileManager.printMainDirectory(addPath: additionPath, myFile: newFile)
    }
    
    //MARK: Create New Directory
    func createNewDirectory() {
        myAppFileManager.createNewDirectory(addPath: additionPath, myFile: newFile)
        cleanNewFile()
    }
    
    //MARK: Delete Item in Directory
    func deleteItemInDirectory() {
        myAppFileManager.deleteItemInDirectory(addPath: additionPath, myFile: selectedFile)
        cleanSelectedFile()
        cleanNewFile()
    }
    
    //MARK: Clean New File
    func cleanNewFile() {
        newFile = MyFile(fileName: "", fileExtension: "", textForFile: "", image: nil, typeOfFile: "")
    }
    
    //MARK: Clean Selected File
    func cleanSelectedFile() {
        selectedFile = MyFile(fileName: "", fileExtension: "", textForFile: "", image: nil, typeOfFile: "")
    }
    
    //MARK: Create New File
    func createNewFile() {
        myAppFileManager.createNewFile(addPath: additionPath, myFile: newFile)
    }
    
    //MARK: Is empty MyFile
    func isEmpty(myFile: MyFile) -> Bool {
        if myFile.fileName.isEmpty || myFile.fileExtension.isEmpty {
            return true
        } else {
            return false
        }
    }
    
    //MARK: Create New File with Text
    func createNewFileWithText() {
        myAppFileManager.createNewFileWithText(addPath: additionPath, myFile: newFile)
        cleanNewFile()
    }
    
    //MARK: Take File with Text
    func takeFileWithText() {
        newFile.textForFile = myAppFileManager.takeFileWithText(addPath: additionPath, myFile: newFile)
    }
    
    
}
