//
//  TimeFrame.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI

struct TimeFrame: View {
    
    let timer = Timer.publish(every: 1, tolerance: 200, on: .main, in: .common).autoconnect()
    @State private var time: String = getFormattedTime(date: Date(), format: "HH : mm : ss")
    
    var body: some View {
        
        HStack {
           
            HStack (alignment: .center, spacing: 15){
                Image(systemName: "clock")
                    .foregroundColor(Color("Blue-Major"))
                    .font(.system(size: 40.0))
                    .padding(.leading, 3)
            
//            Spacer()
            
            Text(time)
                .onReceive(timer) { _ in
                    time = getFormattedTime(date: Date(), format: "HH : mm : ss")
                }
                .foregroundColor(Color("Green-Major"))
                .frame(alignment: .center)
                .font(.system(size: 25, weight: .semibold, design: .default))
                .padding(.trailing)
                
            }
               
        }.frame(width: 230, height: 55, alignment: .center)
            .background(.white)
            .cornerRadius(20)
            .padding(.horizontal)
            
            
    }
}

struct TimeFrame_Previews: PreviewProvider {
    static var previews: some View {
        TimeFrame()
    }
}
