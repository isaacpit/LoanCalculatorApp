//
//  LoanEntryForm.swift
//  MortgageCalculator
//
//  Created by Isaac Pitblado on 2/21/22.
//

import Foundation
import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            opacity: 1.0
        )
    }
    
    init(hex: String, alpha: CGFloat) {
        let scanner = Scanner(string: hex)
//        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff,
            opacity: alpha
        )
    }
}

struct LoanEntryForm : View {

    
    @State private var months : String = ""
    @State private var paymentsPerPeriod : String = ""
    @State private var rate : String = ""
    @State private var loanAmount : String = ""
    
    @State private var debugAvailable : Bool = false
    @State private var currentView : String = "Mode1"
    
    private var views : [String] = ["Mode1", "Mode2"]
    
    init(){
        UITableView.appearance().backgroundColor = .clear
    }
    
    // Just an example function below
    func doSomethingWith(value: String) {
           print("CurrentSelction: \(value)")
     }
    
    var body: some View {
        ZStack {
//            RadialGradient(gradient: Gradient(colors: [
//                Color(red: 0, green: 0, blue: 1, opacity: 0.2),
//                Color(red: 0.75, green: 0, blue: 0, opacity: 0.8)]),
//                   center: .center,
//                   startRadius: 100,
//                   endRadius: 470)
            
            LinearGradient(gradient: Gradient(colors: [
                Color(hex: "ff00d3", alpha: 0.38),
                Color(hex: "650979", alpha: 0.30),
                Color(hex: "00d4ff", alpha: 0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)

            Form {
                Picker("Mode", selection:$currentView) {
                    ForEach(views, id: \.self) { view in
                        Text(String(view))
                    }
                }.pickerStyle(.segmented)
                    .onReceive([self.currentView].publisher.first()) { value in
                                self.doSomethingWith(value: value)
                     }
                
                Toggle(isOn: $debugAvailable) {
                    Text("Debug Available")
                }
                
                Section(header: Text("Period Info").font(.headline)) {
                    HStack {

                        FormEntry(
                            txtLabel: "Periods",
                            txtPlaceholder: "Years",
                            boundVal: $months,
                            keyboardType: .numberPad)

                        
                        FormEntry(
                            txtLabel: "Pymts Per Prd",
                            txtPlaceholder: "Months Per Year",
                            boundVal: $paymentsPerPeriod, keyboardType: .numberPad)

                    }
                }

                Section(header: Text("Loan Info").font(.headline)){

                    HStack {

                        FormEntry(
                            txtLabel: "Rate",
                            txtPlaceholder: "Interest Rate",
                            boundVal: $rate,
                            keyboardType: .decimalPad)

                        FormEntry(
                            txtLabel: "Loan Amount",
                            txtPlaceholder: "Principal",
                            boundVal: $loanAmount,
                            keyboardType: .decimalPad)

                    }
                    

                }
                
                    Button("Done", role: .cancel, action: {
                        print("Click done!")
                        hideKeyboard()
                    }).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 70, alignment: .center)

                if (debugAvailable) {
                    Section(header: Text("Debug Info")) {
                    
                        VStack(alignment: .leading) {
                            Text("Months=\(months)")
                            TextField("Months", text: $months).background(Color(hex: "ffff00"))
                            
                            Text("Pymt=\(paymentsPerPeriod)").background(Color.blue)
                            Text("rate=\(rate)")
                            Text("loanAmount=\(loanAmount)")
                            
                        }
                    }
                }
                

                

            }.background(LinearGradient(gradient: Gradient(colors: [
                Color(hex: "ff00d3", alpha: 0.38),
                Color(hex: "650979", alpha: 0.30),
                Color(hex: "00d4ff", alpha: 0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
)
            
        }.edgesIgnoringSafeArea(.all)
    }
        
//    }
}

struct LoanInfoView_Previews : PreviewProvider {
    
    static var previews: some View {
        Group {
            LoanEntryForm()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
