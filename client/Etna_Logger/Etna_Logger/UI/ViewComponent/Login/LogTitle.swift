//
//  LogTitle.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 08/03/2022.
//

import SwiftUI

struct LogTitle: View {
    var body: some View {
        VStack {
            Text("WELCOME TO")
                .font(.system(size: 13))
                .foregroundColor(.white)
            Text("ETNA")
                .font(.system(size: 45, weight: .bold))
                .foregroundColor(.white)
             
        }
    }
}

struct LogTitle_Previews: PreviewProvider {
    static var previews: some View {
        LogTitle()
            .previewLayout(.sizeThatFits)
    }
}
