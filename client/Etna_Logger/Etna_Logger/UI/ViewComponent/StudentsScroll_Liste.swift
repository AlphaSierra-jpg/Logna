//
//  StudentsScroll_Liste.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct StudentsScroll_Liste: View {
    @StateObject var historyModel: HistoryModel = HistoryModel()
    var body: some View {
        SearchBar(searchString: $historyModel.user)
        CstmButton(imageContent: "plus", textContent: "search") {
            historyModel.byUser()
        }
        ScrollView(showsIndicators: false) {
            VStack {

                ForEach(historyModel.userResList, id: \.self) { item in
                        HStack (alignment: .center, spacing: 25) {
                            Image(systemName: "person.circle")
                                .font(.system(size: 48.0))
                            .foregroundColor(.white)
                            .padding(9)

                            Text(item.login)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(9)
                            .padding(.trailing,-7)

                        CheckFill()
                            .frame(height: 48)
                            .padding(.leading, -3)
                            .padding(.trailing, -10)

                        }.padding(.top, 5)
                    Divider()
                        .foregroundColor(.white)
                        .frame(width: 300 , height: 1)
                    }.refreshable {
                        await historyModel.byUser()
                    }
            }
            
        }.frame(width: 366, height: 546, alignment: .center)
            .background(Color("Green-Modal"))
            .opacity(0.7)
            .cornerRadius(35)
    }
}

struct StudentsScroll_Liste_Previews: PreviewProvider {
    static var previews: some View {
        StudentsScroll_Liste()
    }
}
