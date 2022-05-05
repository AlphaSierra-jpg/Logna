//
//  ListButton.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct ListButton: View {
    var body: some View {
        Button(action: {}) {
            NavigationLink(destination: ListView(), label: {
                    Image(systemName: "list.bullet")
                    .font(.system(size: 40.0))
                          .frame(width: 75, height: 75)
                          .foregroundColor(.white)
                          .background(Color("Green-List"))
                          .cornerRadius(80)
            })
                            
        }
    }
}

struct ListButton_Previews: PreviewProvider {
    static var previews: some View {
        ListButton()
    }
}
