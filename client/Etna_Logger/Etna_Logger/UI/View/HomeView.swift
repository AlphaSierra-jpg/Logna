//
//  HomeView.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct HomeView: View {
    
    
    

    @AppStorage("isLogged") var isLogged:Bool = false
    var body: some View {
        
        VStack {
            CstmButton(imageContent: "x.circle", textContent: "Disconnexion") {
                isLogged = false
            }
            VStack {
                Etna_Title()
            Text(getFormattedDate(date: Date(), format: "EEEE dd MMMM yyyy"))
                .foregroundColor(.white)
                .fontWeight(.semibold)
                
            TimeFrame()
           
            PromoChoices()
                .padding(5)
            StudentsScroll()
            ButtonsNav()
                .padding(7)
            }
        }.background(
            Image("Background")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: getScreenSize().width, height: getScreenSize().height)
                .ignoresSafeArea()
            .hiddenNavigationBarStyle()
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            
            HomeView()
            
        }
    }
}


