//
//  DateFrame.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct DateFrame: View {
    @Binding var dateToSee:String
    var body: some View {
        HStack {
           
            HStack (alignment: .center, spacing: 25){
                Image(systemName: "calendar")
                    .foregroundColor(Color("Blue-Major"))
                    .font(.system(size: 35.0))
                    .padding(.leading, 2)
            
//            Spacer()
            
            Text(dateToSee)
                .foregroundColor(Color("Green-Major"))
                .frame(alignment: .center)
                .font(.system(size: 20, weight: .semibold, design: .default))
                .padding(.trailing)
                
                Image(systemName: "chevron.right")
                    .foregroundColor(Color("Blue-Major"))
                    .font(.system(size: 30.0))
                    .padding(.leading,-12)
                
            }
               
        }.frame(width: 325, height: 70, alignment: .center)
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
    }
}

struct DateFrame_Previews: PreviewProvider {
    static var previews: some View {
        DateFrame(dateToSee: .constant(getFormattedDate(date: Date(), format: "dd MMMM YYYY")))
    }
}
