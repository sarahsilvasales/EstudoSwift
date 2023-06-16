//
//  ContentView.swift
//  TestBluetooth
//
//  Created by projeto smart on 15/06/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Spacer()
            Image(systemName: "pencil")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Add Pencil")
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
