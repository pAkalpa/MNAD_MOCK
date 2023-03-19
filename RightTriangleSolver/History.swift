//
//  History.swift
//  RightTriangleSolver
//
//  Created by Pasindu Akalpa on 2023-03-19.
//  pasinduakalpa1998@gmail.com
//

import SwiftUI

struct History: View {
    @AppStorage("altVal") private var altVal: String = ""
    @AppStorage("baseVal") private var baseVal: String = ""
    @AppStorage("hypoVal") private var hypoVal: String = ""
    @AppStorage("areaVal") private var areaVal: String = ""
    @AppStorage("periVal") private var perimeterVal: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Last Calculation")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Text("Altitude")
                Spacer()
                Text(altVal)
            }
            HStack {
                Text("Base")
                Spacer()
                Text(baseVal)
            }
            HStack {
                Text("Hypotenuse")
                Spacer()
                Text(hypoVal)
            }
            HStack {
                Text("Area")
                Spacer()
                Text(areaVal)
            }
            HStack {
                Text("Perimeter")
                Spacer()
                Text(perimeterVal)
            }
            Spacer()
        }
        .padding(10)
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
