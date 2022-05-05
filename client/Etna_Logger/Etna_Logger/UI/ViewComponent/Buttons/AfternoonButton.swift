//
//  AfternoonButton.swift
//  Etna_Logger
//
//  Created by Racha Hamia  on 12/03/2022.
//

import SwiftUI

struct AfternoonButton: View {
    var body: some View {
        Button(action: {}) {
            NavigationLink(destination: HistoricalSelectionView(), label: {
                    Text("AFTERNOON")
                    .font(.system(size: 30.0, weight: .semibold))
                          .frame(width: 300, height: 60)
                          .foregroundColor(Color("Green-Major"))
                          .background(.white)
                          .cornerRadius(20)
            })
            
        }.padding(.bottom, 15)
        
        
    }
}

struct AfternoonButton_Previews: PreviewProvider {
    static var previews: some View {
        AfternoonButton()
    }
}
