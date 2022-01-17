//
//  ContentView.swift
//  WeSplit
//
//  Created by sanika chavan on 26/07/21.
//

import SwiftUI

struct ContentView: View {
   @State var name = ""
    @State private var people = 2
    @State private var Amount = ""
    @State private var TipPercentage = 2
    @State private var useRedBg = false
    
    let TipPercentages = [0,10,15,20,25]
    var totalPerPerson: Double {
        let peopleCount = Double(people + 2)
        let tipSelection = Double(TipPercentages[TipPercentage])
        let orderAmount = Double(Amount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {
        NavigationView{
            Form{
                Section{
                TextField("Enter you name", text: $name)
                Text("Hola! \(name)")
                TextField("Amount", text: $Amount) .keyboardType(.decimalPad)
                    
                Picker("Number of People", selection: $people) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
            }
                Section (header: Text("How much tip you want to leave?")) {
                    Picker("Tip Percentage", selection: $TipPercentage){
                        ForEach(0 ..< TipPercentages.count){
                            Text("\(self.TipPercentages[$0])%")
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("$\(totalPerPerson)")
                }
                .foregroundColor((TipPercentage != 0) ? .none : .red)

                
                }.navigationBarTitle("We Split!")

        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
