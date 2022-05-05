//
//  ButtonsNav.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct ButtonsNav: View {
    var body: some View {
       
        HStack (alignment: .center, spacing: 20){
            HistoricalButton()
            HomeButton()
            ListButton()
            CreateButton()
        }
    }
}

struct ButtonsNav_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsNav()
    }
}
