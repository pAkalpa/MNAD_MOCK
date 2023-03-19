//
//  ContentView.swift
//  RightTriangleSolver
//
//  Created by Pasindu Akalpa on 2023-03-19.
//  pasinduakalpa1998@gmail.com
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Calculation()
                .tabItem {
                    Label("Calculation", systemImage: "sum")
                }
            History()
                .tabItem {
                    Label("History", systemImage: "list.dash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
