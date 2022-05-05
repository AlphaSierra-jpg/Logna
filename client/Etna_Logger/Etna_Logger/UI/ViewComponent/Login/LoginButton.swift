//
//  LoginButton.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 11/03/2565 BE.
//

import SwiftUI

struct LoginButton: View {
    @State var buttonAction: (() -> Void)?
    var body: some View {
        
        Button("Sign in") {
            
            buttonAction?()
        }.font(.system(size: 30.0, weight: .semibold))
            .frame(width: 300, height: 60)
            .foregroundColor(Color("Green-Major"))
            .background(.white)
            .cornerRadius(20)
            .padding(.bottom, 15)
           // NavigationLink(destination: HomeView(), label: { })
            
        
        
        
        Button(action: {
            
        }) {
            NavigationLink(destination: Etna_Logger(), label: {
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

struct LoginButton_Previews: PreviewProvider {
    static var previews: some View {
        LoginButton().background(Color.black)
    }
}
