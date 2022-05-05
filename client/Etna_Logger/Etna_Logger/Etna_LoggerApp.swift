//
//  Etna_LoggerApp.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 07/03/2022.
//

import SwiftUI

@main
struct Etna_LoggerApp: App {
    @AppStorage("isLogged") var isLogged:Bool = false
    var body: some Scene {
        WindowGroup {
            NavigationView {
//                NavigationLink(destination: EmptyView()) {
//                    EmptyView()
//                } // this is for iPad debug
                if isLogged == false {
                    Etna_Logger()
                }else{
                    HomeView()
                }
            }.navigationViewStyle(StackNavigationViewStyle()) // Permet d'empêcher que la vue se colle sur le côté gauche et donc de prendre tout l'écran
        }
    }
}
