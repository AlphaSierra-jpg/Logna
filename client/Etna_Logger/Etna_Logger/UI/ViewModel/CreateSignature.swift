//
//  CreateSignature.swift
//  Etna_Logger
//
//  Created by Charles Coste on 13/03/2022.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

class CreateSignature: ObservableObject {
    
    @AppStorage("token") var token:String = ""
    @Published var promo:String = ""
    @Published var dateSignature:String = ""
    @Published var dateNow = Date()
    @Published var error:Bool = true
    @Published var message:String = ""
    
    func Create() {
        //var promo: String = "2025 - AP - Septembre"
        //var dateSignature: String = "13 mars 2022"
        
        var jsonResponse: Data??
        
        let group: DispatchGroup = DispatchGroup()
        
        
        let parameters : [String: AnyHashable] = [
            "token": token,
            "promo": promo,
            "date": dateSignature,
        ]
        
        group.enter()
        DispatchQueue.main.async {
            AF.request("http://localhost/createFeedData", method: .post, parameters: parameters, headers: nil).response { response in
                switch response.result {
                    case .success:
                    jsonResponse = response.value
                    print("Message")
                    case let .failure(error):
                    print("Alamofire error: \(error)")
                    
                }
                group.leave()
            }
        }
        
        
        
        group.notify(queue: .main) {
            if jsonResponse != nil {
                if let json = try? JSON(data: jsonResponse!!) {
                    if json["code"] != 200{
                        self.error = false
                        self.message = "Something is wrong with your imput"
                    }
                    else {
                        self.message = "Successfully attendance create"
                    }
                    
                    // Global var for auth -> userInfo
                }
            }
        }
    }
    
}

