//
//  StudentsScroll.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI
import Foundation

struct StudentsScroll: View {
    @StateObject var historyModel: HistoryModel = HistoryModel()

    var body: some View { 
       
        
        ScrollView(showsIndicators: false) {
            VStack {
 
                ForEach(historyModel.userResList, id: \.self) { item in
                    
                    
                    
                    if (historyModel.isMorning ? item.morningSignature == "Abs" || item.morningSignature == "Late" : item.afternoonSignature == "Abs" || item.afternoonSignature == "Late" ) {
                        HStack (alignment: .center, spacing: 25) {
                            Image(systemName: "person.circle")
                                .font(.system(size: 48.0))
                            .foregroundColor(.white)
                            .padding(9)
                            
                            Text("\(item.login): \(historyModel.isMorning ? item.morningSignature : item.afternoonSignature)")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(9)
                            .padding(.trailing,-7)
                        
                            Button(action: {
                                historyModel.justify(morning: historyModel.isMorning, login: item.login, dateToJust: getFormattedDate(date: Date(), format: "YYYY MM dd"))
                            }, label: {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor( .white)
                            })
                            .frame(height: 48)
                            .padding(.leading, -3)
                            .padding(.trailing, -10)
                        
                            
                        }.padding(.top, 5)
                    Divider()
                        .foregroundColor(.white)
                        .frame(width: 300 , height: 1)
                    }
                        
                    }
            }.onAppear{
                
                historyModel.byDate()
            }
            
            
            
        }.frame(width: 366, height: 480, alignment: .center)
            .background(Color("Green-Modal"))
            .opacity(0.7)
            .cornerRadius(35)
            
    }
}

struct StudentsScroll_Previews: PreviewProvider {
    static var previews: some View {
        StudentsScroll()
    }
}
