//
//  CreateButton.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct CreateButton: View {
    var body: some View {
        Button(action: {}) {
            NavigationLink(destination: CreateView(), label: {
                    Image(systemName: "plus")
                    .font(.system(size: 40.0))
                          .frame(width: 75, height: 75)
                          .foregroundColor(.white)
                          .background(Color("Green-Create"))
                          .cornerRadius(90)
            })
                            
        }
    }
}

struct CreateButton_Previews: PreviewProvider {
    static var previews: some View {
        CreateButton()
    }
}
