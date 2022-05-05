//
//  BackButton.swift
//  Etna_Logger
//
//  Created by Charles Coste on 13/03/2022.
//

import SwiftUI

struct BackButton: View {
    var body: some View {
        Button(action: {}) {
            NavigationLink(destination:
                    HomeView(), label: {
                    Image(systemName: "arrow.backward")
                    .font(.system(size: 35.0, weight: .bold))
                          .frame(width: 50, height: 50)
                          .foregroundColor(Color("Green-Major"))
                          .background(.white)
                          .cornerRadius(80)
            })
                            
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton()
    }
}
