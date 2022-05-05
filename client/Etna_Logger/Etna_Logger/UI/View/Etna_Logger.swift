//
//  ContentView.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 07/03/2022.
//

import SwiftUI
import CheckDevice

struct Etna_Logger: View {
    
    @State var goLogin: Bool = false
    @State var goScan: Bool = false
    var body: some View {
            VStack{
                LogTitle()
                CstmButton(imageContent: "person", textContent: "LOGIN", buttonAction: {
                    goLogin = true
                    
                }).padding(.bottom, -20)
          

                CstmButton(imageContent: "qrcode", textContent: "SCAN",  buttonAction: {
                    goScan = true
                }).padding(.top, -10)
                    
                NavigationLink(isActive: $goLogin) {LoginView()} label: {EmptyView()}
                NavigationLink(isActive: $goScan) {ScanView()} label: {EmptyView()}
            }
            .hiddenNavigationBarStyle()
            .padding(.bottom, 20)
            .background(
                Image("Background")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(width: getScreenSize().width, height: getScreenSize().height)
                    .ignoresSafeArea()
            )
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Etna_Logger()
        }
    }
}
