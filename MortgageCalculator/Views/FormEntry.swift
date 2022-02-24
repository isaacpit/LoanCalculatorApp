//
//  SmallTextField.swift
//  MortgageCalculator
//
//  Created by Isaac Pitblado on 2/21/22.
//

import SwiftUI

struct FormEntry : View {
    var txtLabel : String
    var txtPlaceholder : String
    @Binding var boundVal : String
    var keyboardType: UIKeyboardType
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(txtLabel)
                .font(.headline)
                .lineLimit(nil)
            TextField(txtPlaceholder, text: $boundVal)
                .foregroundColor(Color.black)
                .keyboardType(keyboardType)
                .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                .clipShape(Capsule())

        }
    }
}
