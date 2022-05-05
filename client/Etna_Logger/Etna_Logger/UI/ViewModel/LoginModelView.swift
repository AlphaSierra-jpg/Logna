//
//  File.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 11/03/2022.
//
import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

class LoginModelView : ObservableObject {
    @Published var login: String = ""
    @Published var password: String = ""
    @Published var Error:Bool = false
    
    @AppStorage("token") var token:String = ""
    @AppStorage("isLogged") var isLogged:Bool = false
    func auth() {
        let parameters : [String: AnyHashable] = [
            "login": login,
            "password": password,
        ]
        let group: DispatchGroup = DispatchGroup()
        var message: Data??
        group.enter()
                DispatchQueue.main.async {
                    AF.request("http://localhost/auth", method: .post, parameters: parameters, headers: nil).response { response in
                        switch response.result {
                            case .success:
                            message = response.value
                            case let .failure(error):
                            print("Alamofire error: \(error)")
                        }
                        group.leave()
                    }
                }
        group.notify(queue: .main) {
            if message != nil {
                if let data = try? JSON(data: message!!){
                    if data["code"] == 200 {
                        let reqToken = data["datas"]["token"]
                        self.login = ""
                        self.password = ""
                        let jsonData = try? JSONEncoder().encode(reqToken)
                        self.token = String(data: jsonData!, encoding: .utf8)!
                        self.isLogged = true
                    }else{
                        self.Error = true
                    }
                }
            }
        }
        
        
    }
}
