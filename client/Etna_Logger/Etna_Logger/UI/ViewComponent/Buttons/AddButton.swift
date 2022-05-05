//
//  AddButton.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI
import SimpleToast

struct AddButton: View {
    
    @State private var isShowingToast = false
    @State var buttonAction: (() -> Void)?
    @Binding var isError:Bool
    @Binding var message:String
    
    private let toastOptions = SimpleToastOptions(
        alignment: .center,
        hideAfter: 2,
        backdrop: Color.black.opacity(0),
        animation: .default,
        modifierType: .slide
    )
    

    var body: some View {
        Button(action: {
            //createSignature.Create()
            buttonAction?()
            isShowingToast.toggle()
        }) {
            //NavigationLink(destination: HomeView(), label: {
                    Image(systemName: "plus")
                    .font(.system(size: 70.0))
                          .frame(width: 150, height: 150)
                          .foregroundColor(Color("Green-Major"))
                          .background(.white)
                          .cornerRadius(80)
            //})
                            
        }
        .simpleToast(isPresented: $isShowingToast, options: toastOptions, onDismiss: {isError = true}) {
            HStack {
                Text(message).font(.system(size: 17, weight: .black))
            }
            .padding(20)
            .background(isError ? Color.green : Color.red)
            .foregroundColor(.white)
            .cornerRadius(14)
        }
        .frame(width: 650, height: 230, alignment: .center)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(buttonAction: {
            print("print Hello")
        }, isError: .constant(true), message: .constant("test"))
    }
}
