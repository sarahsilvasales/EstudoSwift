//
//  NewFileView.swift
//  FileManager
//
//  Created by projeto smart on 03/07/23.
//

import SwiftUI

struct NewFileView: View {
    
    @ObservedObject var myAppViewModel: MyAppViewModel
    
    var body: some View {
        List {
            
            //section 1
            Section {
                TextField("File Name", text: $myAppViewModel.newFile.fileName)
                TextField("File Extension", text: $myAppViewModel.newFile.fileExtension)
            } header: {
                Text("Naming File Section")
            }
            .autocapitalization(.none)
            
            //section 2
            Section {
                Button {
                    myAppViewModel.createNewFile()
                } label: {
                    Text("Create New File")
                }
            } header: {
                Text("Button Section")
            }
            .disabled(myAppViewModel.isEmpty(myFile: myAppViewModel.newFile))
            
            //section 3
            Section {
                TextField("File Name", text: $myAppViewModel.selectedFile.fileName)
                TextField("File extension", text: $myAppViewModel.selectedFile.fileExtension)
            } header: {
                Text("Section for Delete File")
            }
            
            //section 4
            Section {
                Button(role: .destructive) {
                    myAppViewModel.deleteItemInDirectory()
                } label: {
                    Text("Delete File")
                }
            } header: {
                Text("Button Section")
            }
            .disabled(myAppViewModel.isEmpty(myFile: myAppViewModel.selectedFile))
        }
        .navigationTitle("Create and Delete New File")
    }
}

struct NewFileView_Previews: PreviewProvider {
    static var previews: some View {
        NewFileView(myAppViewModel: MyAppViewModel())
    }
}
