//
//  NewFileWithTextView.swift
//  FileManager
//
//  Created by projeto smart on 03/07/23.
//

import SwiftUI

struct NewFileWithTextView: View {
    
    @ObservedObject var myAppViewModel: MyAppViewModel
    
    var body: some View {
        List {
            Section {
                TextEditor(text: $myAppViewModel.newFile.textForFile)
                    .frame(minHeight: 200)
            } header: {
                Text("Text Editor Section")
            }
            
            Section {
                TextField("File Name", text: $myAppViewModel.newFile.fileName)
                TextField("File Extension", text: $myAppViewModel.newFile.fileExtension)
            } header: {
                Text("Text Editor Section")
            }
            .autocapitalization(.none)
            
            Section {
                Button("Save File With Text") {
                    myAppViewModel.createNewFileWithText()
                }
                Button("Take File With Text") {
                    myAppViewModel.takeFileWithText()
                }
            } header: {
                Text("Button Section")
            }
            .disabled(myAppViewModel.isEmpty(myFile: myAppViewModel.newFile))
            
            Section {
                Button(role: .destructive) {
                    myAppViewModel.deleteItemInDirectory()
                } label: {
                    Text("Delete File With Text")
                }
            } header: {
                Text("Button Section")
            }
            .disabled(myAppViewModel.isEmpty(myFile: myAppViewModel.selectedFile))
        }
        .navigationTitle("Save and Return File With Text")
    }
}

struct NewFileWithTextView_Previews: PreviewProvider {
    static var previews: some View {
        NewFileWithTextView(myAppViewModel: MyAppViewModel())
    }
}
