//
//  HomeButton.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct HomeButton: View {
    var body: some View {
        Button(action: {}) {
            NavigationLink(destination: HomeView(), label: {
                    Image(systemName: "house")
                    .font(.system(size: 40.0))
                          .frame(width: 75, height: 75)
                          .foregroundColor(.white)
                          .background(Color("Green-Home"))
                          .cornerRadius(90)
            })
                            
        }
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton()
    }
}
