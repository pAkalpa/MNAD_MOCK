//
//  Calculation.swift
//  RightTriangleSolver
//
//  Created by Pasindu Akalpa on 2023-03-19.
//  pasinduakalpa1998@gmail.com
//

import SwiftUI

struct Calculation: View {
    let choiceArray = [
        "Base",
        "Altitude",
        "Hypotenuse"
    ]
    
    @State var selectedItem: String = "Base"
    @State var remainingArray: [String] = []
    @State var remainingFields: [String] = ["", ""]
    @State var showOutput: Bool = false
    @State var lengthValue: String = ""
    
    @AppStorage("altVal") private var altVal: String = ""
    @AppStorage("baseVal") private var baseVal: String = ""
    @AppStorage("hypoVal") private var hypoVal: String = ""
    @AppStorage("areaVal") private var areaVal: String = ""
    @AppStorage("periVal") private var perimeterVal: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Triangle Calculator")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Image("pt")
                    .resizable()
                    .frame(width: 300, height: 300)
                HStack {
                    Text("Choose the unknown edge")
                        .fontWeight(.semibold)
                    Picker("Choose the unknown edge", selection: $selectedItem, content: {
                        ForEach(choiceArray, id: \.self) { item in
                            Text(item)
                        }
                    })
                    .onChange(of: selectedItem) { _ in
                        getList()
                        showOutput = false
                        for index in remainingFields.indices {
                            remainingFields[index] = ""
                        }
                        lengthValue = ""
                    }
                    .pickerStyle(.wheel)
                }
                .onAppear() {
                    getList()
                }
                HStack {
                    Text("Enter known length values")
                        .fontWeight(.semibold)
                    Spacer()
                }
                VStack {
                    ForEach(0..<remainingArray.count, id: \.self) { index in
                        TextField("\(remainingArray[index]) Value", text: $remainingFields[index])
                            .keyboardType(.decimalPad)
                    }
                }
                .textFieldStyle(.roundedBorder)
                Button {
                    calculateUnknownLength()
                    if lengthValue != "" {
                        calculateArea()
                        calculatePerimeter()
                        showOutput = true
                    }
                } label: {
                    Text("Calculate")
                        .padding(10)
                }
                .buttonStyle(.borderedProminent)
                .tint(.green)
                .padding(.top)
                if showOutput {
                    VStack(spacing: 10) {
                        HStack {
                            Text(selectedItem)
                            Spacer()
                            Text(lengthValue)
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
                    }
                    .padding(.top)
                }
            }
            .padding(30)
        }
    }
    func getList() {
        remainingArray = choiceArray.filter() { $0 != selectedItem }
    }
    
    func calculateUnknownLength() {
        guard let fieldOneVal = Double(remainingFields[0]),
              let fieldTwoVal = Double(remainingFields[1]) else {
            return
        }
        
        var length: Double = 0.0
        
        switch selectedItem {
        case choiceArray[0]:
            length = sqrt(pow(fieldTwoVal, 2) - pow(fieldOneVal, 2))
            baseVal = String(format: "%.2f", length)
            altVal = String(format: "%.2f", fieldOneVal)
            hypoVal = String(format: "%.2f", fieldTwoVal)
        case choiceArray[1]:
            length = sqrt(pow(fieldTwoVal, 2) - pow(fieldOneVal, 2))
            baseVal = String(format: "%.2f", fieldOneVal)
            altVal = String(format: "%.2f", length)
            hypoVal = String(format: "%.2f", fieldTwoVal)
        case choiceArray[2]:
            length = sqrt(pow(fieldTwoVal, 2) + pow(fieldOneVal, 2))
            baseVal = String(format: "%.2f", fieldOneVal)
            altVal = String(format: "%.2f", fieldTwoVal)
            hypoVal = String(format: "%.2f", length)
        default:
            print("Error")
        }
        
        lengthValue = String(format: "%.2f", length)
    }
    
    func calculateArea() {
        guard let altitude = Double(altVal),
              let base = Double(baseVal) else {
            return
        }
        let area = (altitude * base) / 2
        areaVal = String(format: "%.2f", area)
    }
    
    func calculatePerimeter() {
          guard let altitude = Double(altVal),
              let base = Double(baseVal) else {
            return
        }
        let perimeter = altitude + base + sqrt(pow(altitude, 2) + pow(base, 2))
        perimeterVal = String(format: "%.2f", perimeter)
    }
}

struct Calculation_Previews: PreviewProvider {
    static var previews: some View {
        Calculation()
    }
}
