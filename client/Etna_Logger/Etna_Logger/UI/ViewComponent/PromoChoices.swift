//
//  PromoChoices.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct PromoChoices: View {
    var body: some View {
        
        HStack {
            HStack (alignment: .center) {
                Text("Promo")
                    .frame(width: 90, height: 30, alignment: .center)
                    .background(Color("Green-Major"))
                    .cornerRadius(20)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
                
                Text("AP 2025")
                    .foregroundColor(Color("Blue-Major"))
                    .font(.system(size: 14, weight: .bold))
                    .padding()
                    
                
            }
        }.frame(width: 235, height: 30)
        .background(.white)
        .cornerRadius(20)
        
    }
}

struct PromoChoices_Previews: PreviewProvider {
    static var previews: some View {
        PromoChoices()
    }
}
