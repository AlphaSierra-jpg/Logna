//
//  DatePickerBootcamp.swift
//  Etna_Logger
//
//  Created by Charles Coste on 14/03/2022.
//

import SwiftUI


struct DatePickerBootcamp: View {

    @Binding var date:Date

    var body: some View {

        HStack {
            SwiftUI.DatePicker("Select a Date", selection: $date,
                               displayedComponents: [.date])
                .padding(.horizontal)
                .frame(width: 300, height: 60, alignment: .center)
                .foregroundColor(Color("Blue-Major"))
                .accentColor(Color("Green-Major"))
                .background(.white)


        } .frame(width: 315, height: 50, alignment: .center)
            .background(.white)
            .cornerRadius(20)
    }
}

struct DatePickerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerBootcamp(date: .constant(Date()))
    }
}

