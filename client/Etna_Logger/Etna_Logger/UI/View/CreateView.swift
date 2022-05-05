//
//  CreateView.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct CreateView: View {
    @StateObject var createSignature: CreateSignature = CreateSignature()
    var body: some View {
        VStack {
            Etna_Title()
                .padding(.bottom, 5)
            VStack {
                DateFrame(dateToSee: $createSignature.dateSignature)
                DatePickerBootcamp(date: $createSignature.dateNow)
                PromoField(promoName: $createSignature.promo)
            }
            .padding()
            AddButton(buttonAction: {
                createSignature.Create()
            }, isError: $createSignature.error, message: $createSignature.message)
            
            BackButton()
                .padding(.top, 20)
            
            Text("Create attendance sheet")
                .foregroundColor(.white)
                .fontWeight(.semibold)
            
        }.background(
            Image("Background")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: getScreenSize().width, height: getScreenSize().height)
                .ignoresSafeArea()
            .hiddenNavigationBarStyle()
        ).onAppear {
            createSignature.dateSignature = getFormattedDate(date: createSignature.dateNow, format: "dd MMMM YYYY")
        }
    }
}


struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        CreateView()
        }
    }
}
