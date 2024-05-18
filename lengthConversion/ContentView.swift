//
//  ContentView.swift
//  lengthConversion
//
//  Created by Fernando A on 5/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var unitChosen = ""
    @State private var unitConversion = ""
    @State private var userInput = 0.0
    private var units = ["meter", "kilometer", "feet", "yard", "mile"]
    

    var conversionRate: Double {
        
        let amountInMeters = convertToMeters(amount: userInput, unit: unitChosen)
        return convertFromMeters(amount: amountInMeters, unit: unitConversion)
        
        }
    //converts the chosen unit to Meters by reversing the formula
    func convertToMeters(amount: Double, unit: String) -> Double {
        switch unit {
        case "kilometer":
            return amount * 1000
        case "feet":
            return amount / 3.281
        case "yard":
            return amount / 1.094
        case "mile":
            return amount * 1609
        default:
            return amount
        }
    }
    //converts the meters into the choosen unit by their original formula 
    func convertFromMeters(amount: Double, unit: String) -> Double {
        switch unit {
        case "kilometer":
            return amount / 1000
        case "feet":
            return amount * 3.281
        case "yard":
            return amount * 1.094
        case "mile":
            return amount / 1609
        default:
            return amount
        }
    }
        
    
    var body: some View {
        NavigationStack {
            Form {
                Section("What unit do you want to convert from?") {
                    Picker("Convert from", selection: $unitChosen){
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section {
                    TextField("Measurement", value: $userInput,format: .number)
                }
                Section("What unit do you want to convert to?"){
                    Picker("Convert to", selection: $unitConversion) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output") {
                    Text("Converted amount is \(conversionRate)")
                }
            }
        }

    }
}

#Preview {
    ContentView()
}
