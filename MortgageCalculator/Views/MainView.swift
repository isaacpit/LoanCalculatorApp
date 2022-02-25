//
//  ContentView.swift
//  MortgageCalculator
//
//  Created by Isaac Pitblado on 2/21/22.
//

import SwiftUI

struct MainView: View {
    @State private var months : String = ""
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
            TabView {
                
                LoanEntryForm().tabItem {
                        Image(systemName: "list.bullet")
                        Text("Amortization")
                }.background(Color.white)
                
                VStack {
                    Text("System Info")
                }.tabItem {
                    Image(systemName: "doc.fill")
                    Text("Properties")
                }
            }.statusBar(hidden: false)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
    }
}
