//
//  SecondPartView.swift
//  FileManager
//
//  Created by projeto smart on 03/07/23.
//

import SwiftUI

struct SecondPartView: View {
    
    @ObservedObject var myAppViewModel: MyAppViewModel
    
    var body: some View {
        List {
            //section
            Section {
                NavigationLink("Create New File") {
                    NewFileView(myAppViewModel: myAppViewModel)
                }
            } header: {
                Text("Create New File")
            }
            
            //section
            Section {
                NavigationLink("Create new file with text") {
                    NewFileWithTextView(myAppViewModel: myAppViewModel)
                }
            } header: {
                Text("Create new file with text")
            }
            
            
        }.navigationTitle("File Manager &SwiftUI Second Part")
    }
}

struct SecondPartView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPartView(myAppViewModel: MyAppViewModel())
    }
}
