//
//  icaloriesApp.swift
//  icalories
//
//  Created by projeto smart on 11/05/23.
//

import SwiftUI

@main
struct icaloriesApp: App {
    
    @StateObject private var dataController = DataController()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
