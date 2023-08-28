//
//  ContentView.swift
//  TimeConverter
//
//  Created by Chuck Belcher on 8/27/23.
//
// Challenge
// Time conversion: users choose seconds, minutes, hours, or days.

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = 0
    @State private var userInputUnit = "Days"
    @State private var userOutputUnit = "Seconds"
    @FocusState private var userInputIsFocused: Bool
    
    let userOptions = ["Days", "Hours", "Minutes", "Seconds"]
    var conversionValue: Int {
        //Compute conversion amount here
        return 0
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        TextField("Initial Value", value: $userInput, format: .number)
                            .keyboardType(.decimalPad)
                            .focused($userInputIsFocused)
                        Picker("", selection: $userInputUnit) {
                            ForEach(userOptions, id: \.self) { unit in
                                Text(unit)
                            }
                        }
                    }
                    
                } header: {
                Text("Enter initial value")
                }
                
                Section {
                    Picker("Input Unit", selection: $userOutputUnit) {
                        ForEach(userOptions, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Select Output Unity")
                }
                
                Section {
                    HStack {
                        Text("\(conversionValue)")
                            .foregroundColor(.blue)
                        Text(userOutputUnit)
                            .opacity(0.40)
                    }
                    .font(.title)
                } header: {
                    Text("Resuilts")
                }
            }
            .navigationTitle("Time Conversion")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        userInputIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
