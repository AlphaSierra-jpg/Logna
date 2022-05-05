//
//  HistoricalButton.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

//Change destination View

struct HistoricalButton: View {
    var body: some View {
        Button(action: {}) {
            NavigationLink(destination: HistoricalSelectionView(), label: {
                    Image(systemName: "clock.arrow.circlepath")
                    .font(.system(size: 40.0))
                          .frame(width: 75, height: 75)
                          .foregroundColor(.white)
                          .background(Color("Green-Historical"))
                          .cornerRadius(80)
            })
                            
        }
    }
}

struct HistoricalButton_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalButton()
    }
}
