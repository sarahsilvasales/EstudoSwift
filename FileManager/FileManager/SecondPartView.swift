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
            Section {
                NavigationLink("Create New File") {
                    NewFileView(myAppViewModel: myAppViewModel)
                }
            } header: {
                Text("Create New File")
            }
        }.navigationTitle("File Manager &SwiftUI Second Part")
    }
}

struct SecondPartView_Previews: PreviewProvider {
    static var previews: some View {
        SecondPartView(myAppViewModel: MyAppViewModel())
    }
}
