//
//  LoginView.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 11/03/2565 BE.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginModel : LoginModelView  = LoginModelView()
    @AppStorage("isLogged") var isLogged:Bool = false
    var body: some View {
        VStack {
            Etna_Title()
            Text("Loging to access")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            LoginFields(loginText: $loginModel.login, passwordText: $loginModel.password)
                .padding()
            LoginButton {
                loginModel.auth()
            }           
        }.background(
            Image("Background")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: getScreenSize().width, height: getScreenSize().height)
                .ignoresSafeArea()
            .hiddenNavigationBarStyle()
        ).alert("Error something is wrong about your login or your password", isPresented: $loginModel.Error) {
            Button("try again", role: .cancel) { loginModel.Error = false }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        LoginView()
        }
    }
}
