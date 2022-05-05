//
//  HistoricalMainView.swift
//  Etna_Logger
//
//  Created by Racha Hamia  on 12/03/2022.
//

import SwiftUI

struct HistoricalSelectionView: View {
    var body: some View {
        
        VStack {
            Etna_Title()
                .padding(1)
            //DatePickerBootcamp(date: Binding<Date>)
            PromoChoices()
            MorningButton()
            AfternoonButton()
            BackButton()
            
        }.background(
        Image("Background")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: getScreenSize().width, height: getScreenSize().height)
            .ignoresSafeArea()
            .hiddenNavigationBarStyle()
        )
    }
}

struct HistoricalSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricalSelectionView()
    }
}

