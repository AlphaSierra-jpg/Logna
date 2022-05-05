//
//  ListView.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        VStack {
            Etna_Title()
                .padding(.bottom, -5)
            PromoChoices()
                .padding(-3)
           
                
            StudentsScroll_Liste()
                .padding(.top, 5)
                .padding(.bottom, -2)
            ButtonsNav()
                .padding(.top)
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

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
    }
}
