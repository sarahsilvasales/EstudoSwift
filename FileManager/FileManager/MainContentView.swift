//
//  ContentView.swift
//  FileManager
//
//  Created by projeto smart on 30/06/23.
//

import SwiftUI

struct MainContentView: View {
    
    @StateObject var myAppViewModel: MyAppViewModel = MyAppViewModel()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink("Create and Delete Folder") {
                        NewFolderView(myAppViewModel: myAppViewModel)
                    }
                } header: {
                    Text("Part #1. Create and Delete New Folder")
                }
                Section {
                    NavigationLink("Part #2") {
                        SecondPartView(myAppViewModel: myAppViewModel)
                    }
                } header: {
                    Text("Part #2")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("File Manager and SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView()
    }
}
