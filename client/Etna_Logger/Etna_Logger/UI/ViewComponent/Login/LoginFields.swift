//
//  LoginFields.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 11/03/2565 BE.
//

import SwiftUI

struct LoginFields: View {
    
    @Binding var loginText:String
    @Binding var passwordText:String
    var body: some View {
        VStack (alignment: .center, spacing: 10){
            
            TextField("Login ETNA", text:$loginText)
                .padding()
                .frame(width: 300, height: 55, alignment: .center)
                .background(Color.white.opacity(0.6))
                .cornerRadius(20)
            
            SecureField("Password", text:$passwordText)
                .padding()
                .frame(width: 300, height: 55, alignment: .center)
                .background(Color.white.opacity(0.6))
                .cornerRadius(20)
                
        }
        
    }
}

struct LoginFields_Previews: PreviewProvider {
    static var previews: some View {
        LoginFields(loginText: .constant(""), passwordText: .constant("") )
    }
}
