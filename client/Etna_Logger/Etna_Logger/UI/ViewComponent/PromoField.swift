//
//  PromoField.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct PromoField: View {
    
    @Binding var promoName:String
    var body: some View {
        HStack {
            
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding()
            
            TextField(
                " Name of the promo . . .",
                text: $promoName
            )
        }.frame(width: 300, height: 35)
            .background(
                Color.white
                    .opacity(0.6)
                    .cornerRadius(20)
                )
    }
}

struct PromoField_Previews: PreviewProvider {
    static var previews: some View {
        PromoField(promoName: .constant("2025 - AP - Septembre"))
    }
}
