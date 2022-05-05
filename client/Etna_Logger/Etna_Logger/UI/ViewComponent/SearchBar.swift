//
//  SearchBar.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchString:String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding()
            TextField("Search ...", text: $searchString)
                .foregroundColor(.white)
        }
        .frame(width: 300, height: 35)
        .background(
            Color.white
                .opacity(0.6)
                .cornerRadius(20)
        )
        .padding()
        
            
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchString: .constant("jess"))
    }
}
