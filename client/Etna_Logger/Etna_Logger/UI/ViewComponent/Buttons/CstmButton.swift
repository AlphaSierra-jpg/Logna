//
//  LogBtn.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 08/03/2022.
//

import SwiftUI

struct CstmButton: View {
    @State var imageContent: String
    @State var textContent: String
    @State var buttonAction: (() -> Void)?
    
    var body: some View {
        VStack {
            Button(action: {
                buttonAction?()
            }, label: {
                
                Image(systemName: imageContent)
                    .font(.system(size: 30.0, weight: .semibold))
                    .foregroundColor(Color("Blue-Major"))
                    .padding()
                    .padding(.leading, -30)
                
                Text(textContent)
                    .foregroundColor(Color("Green-Major"))
                    .font(.system(size: 20.0, weight: .bold))
                    
            })
                .background(
                    Color.white
                        .frame(width: 300, height: 60)
                        .cornerRadius(20)
                        
                )
        }.padding()
    }
}

struct CstmButton_Previews: PreviewProvider {
    static var previews: some View {
        CstmButton(
            imageContent: "person",
            textContent: "My Button",
            buttonAction: {
                print("test")
            }
        ).previewLayout(.sizeThatFits).background(Color.black)
    }
}
