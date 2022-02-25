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
    var _boundVal : Binding<String>
    var keyboardType: UIKeyboardType
    var txtLabelSuffix : String
    
    init(txtLabel : String, txtPlaceholder : String, boundVal : Binding<String>, keyboardType : UIKeyboardType, txtLabelSuffix : String) {
        self.txtLabel = txtLabel
        self.txtPlaceholder = txtPlaceholder
        _boundVal = boundVal
        self.keyboardType = keyboardType
        self.txtLabelSuffix = txtLabelSuffix
    }
    
    var body : some View {
        VStack(alignment: .leading) {
            Text(txtLabel)
                .font(.headline)

            HStack {
                TextField(txtPlaceholder, text: _boundVal)
                    .foregroundColor(Color.black)
                    .keyboardType(keyboardType)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .background(Color(red: 230/255, green: 230/255, blue: 230/255))
                    .clipShape(Capsule())
                txtLabelSuffix == "" ? nil : Text(txtLabelSuffix)
            }
            
        }
    }
}
