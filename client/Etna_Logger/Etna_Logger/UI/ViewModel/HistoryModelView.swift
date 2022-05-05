//
//  HistoryModel.swift
//  Etna_Logger
//
//  Created by Charles Coste on 14/03/2022.
//

import Foundation
import Alamofire
import SwiftUI
import SwiftyJSON

class HistoryModel: ObservableObject {
    
    @Published var userResList = [UserResStruct]()
    @Published var isMorning:Bool = false
    @Published var user: String = ""
    

    func byDate(){
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        if (hour >= 0 && hour <= 12){
            self.isMorning = true
        }else {
            self.isMorning = false
        }
        let promoId: Int = 731
        var dateSignature: String = getFormattedDate(date: Date(), format: "YYYY MM dd")
        
        dateSignature = dateSignature.replacingOccurrences(of: " ", with: "-", options: .literal, range: nil)
        
        
        var jsonResponse: Data??
        
        let group: DispatchGroup = DispatchGroup()
        
        let url:String = "http://localhost/historyByDate/\(promoId)/\(dateSignature)"
        
        print(url)
        
        group.enter()
        DispatchQueue.main.async {
            AF.request (url , method: .get, headers: nil).response { response in
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
                    
                    for fc in json["datas"]["resp"] {
                        
                        
                        let response = UserResStruct(
                            login: fc.1["login"].stringValue,
                            firstname: fc.1["firstname"].stringValue,
                            lastname: fc.1["lastname"].stringValue,
                            date: fc.1["date"].stringValue,
                            morningSignature: fc.1["morningSignature"].stringValue,
                            afternoonSignature: fc.1["afternoonSignature"].stringValue,
                            promotion: fc.1["promotion"].stringValue,
                            promotion_id: fc.1["promotion_id"].intValue
                        )
                        self.userResList.append(response)
                    }
                    
                }
                
            }
            
        }
    }
    
    func byUser() {
        
        
        
        var jsonResponse: Data??
        
        let group: DispatchGroup = DispatchGroup()
        
        let url:String = "http://localhost/historyByUser/\(self.user)"
        print(url)
        group.enter()
        DispatchQueue.main.async {
            AF.request (url , method: .get, headers: nil).response { response in
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
                    
                    
                    // Global var for auth -> userInfo
                }
            }
        }
    }
    
    func byUserDate() {
        
        let user: String = "coste_c"
        let dateSignature: String = "2022-03-13"
        
        var jsonResponse: Data??
        
        let group: DispatchGroup = DispatchGroup()
        
        let url:String = "http://localhost/historyByUser/\(user)/\(dateSignature)"
        print(url)
        group.enter()
        DispatchQueue.main.async {
            AF.request (url , method: .get, headers: nil).response { response in
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
                    
                    
                    // Global var for auth -> userInfo
                }
            }
        }
    }
    
    func justify(morning: Bool, login: String, dateToJust: String ){
        var isTheMorning: Int = 0
        
        if (morning == true) {
            isTheMorning = 1
        }
    
        
        let parameters : [String: AnyHashable] = [
            "login": login,
            "dateTime": dateToJust.replacingOccurrences(of: " ", with: "-", options: .literal, range: nil),
            "isMorning": "\(isTheMorning)"
        ]
        print(parameters)
        
        
        
        DispatchQueue.main.async {
            AF.request("http://localhost/justification", method: .put, parameters: parameters, headers: nil).response { response in
                switch response.result {
                    case .success:
                        print(response.response?.statusCode)
                    case let .failure(error):
                        print("Alamofire error: \(error)")
                    
                }
                
            }
        }
    }
}


