//
//  CheckFill.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct CheckFill: View {
    
    @State private var isChecked = false
    
    var body: some View {
        VStack {
            CheckButton(isChecked: $isChecked)
        }
    }
}

struct CheckButton: View {
    @Binding var isChecked: Bool

    var body: some View {
        Button(action: {
            self.isChecked.toggle()
        }, label: {
            Image(systemName: isChecked ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(isChecked ? (Color("Green-Check")) : .white)
        })
    }
}

struct CheckFill_Previews: PreviewProvider {
    static var previews: some View {
        CheckFill()
    }
}
