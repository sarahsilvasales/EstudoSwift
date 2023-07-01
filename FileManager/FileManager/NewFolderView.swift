//
//  NewFolderView.swift
//  FileManager
//
//  Created by projeto smart on 30/06/23.
//

import SwiftUI

struct NewFolderView: View {
    
    @ObservedObject var myAppViewModel: MyAppViewModel
    
    var body: some View {
        List {
            
            Section {
                TextField("Folder Name", text: $myAppViewModel.newFile.fileName)
                    .autocapitalization(.none)
            } header: {
                Text("Naming Folder Section")
            }
            
            Section {
                Button {
                    myAppViewModel.printMainDirectory()
                } label: {
                    Text("Print Main Directory")
                }
                Button {
                    myAppViewModel.createNewDirectory()
                } label: {
                    Text("Create new Folder")
                }
                .disabled(myAppViewModel.newFile.fileName.isEmpty)
            } header: {
                Text("Button Section")
            }
            
            Section {
                TextField("Select Folder Name", text: $myAppViewModel.selectedFile.fileName)
                    .autocapitalization(.none)
            } header: {
                Text("Select for delete folder")
            }
            
            Section {
                Button(role: .destructive) {
                    myAppViewModel.deleteItemInDirectory()
                } label: {
                    Text("Delete Folder")
                }
            } header: {
                Text("Select for delete folder")
            }
            
        }
        .navigationTitle("Create and Delete Folder")
    }
}

struct NewFolderView_Previews: PreviewProvider {
    static var previews: some View {
        NewFolderView(myAppViewModel: MyAppViewModel())
    }
}
