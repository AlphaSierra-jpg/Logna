//
//  ScannerModelView.swift
//  Etna_Logger
//
//  Created by Jessy Habert on 12/03/2022.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON
class ScannerModelView : ObservableObject {
 
    @Published var QrCodeResult:String = ""
    @Published var message:String = ""
    @Published var erreur: Bool = false
    
    @AppStorage("token") var token:String = ""
    
    func checkIn() {
        print (QrCodeResult)
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        print (hour)
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        var stringMonth = ""
        
        switch month {
        case 1 :
            stringMonth = "january"
        case 2 :
            stringMonth = "february"
        case 3 :
            stringMonth = "march"
        case 4 :
            stringMonth = "april"
        case 5 :
            stringMonth = "may"
        case 6 :
            stringMonth = "june"
        case 7 :
            stringMonth = "july"
        case 8 :
            stringMonth = "august"
        case 9 :
            stringMonth = "september"
        case 10 :
            stringMonth = "october"
        case 11 :
            stringMonth = "november"
        case 12 :
            stringMonth = "december"
        default :
            break
        }
        let dateNow = "\(day) \(stringMonth) \(year)"
        print(dateNow)
        var isMorning:Bool
        if (hour >= 0 && hour <= 12){
            isMorning = true
        }else {
            isMorning = false
        }
        let parameters : [String: AnyHashable] = [
            "QrData": QrCodeResult,
            "dateTime": dateNow,
            "isMorning": isMorning,
        ]
        let group: DispatchGroup = DispatchGroup()
        var message: Data??
        group.enter()
                DispatchQueue.main.async {
                    AF.request("http://localhost/checkin", method: .put, parameters: parameters, headers: nil).response { response in
                        switch response.result {
                            case .success:
                            message = response.value
                            print("hello")
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
                        print(data["datas"])
                        if data["datas"]["resp"]["matchedCount"] == 1 {
                            self.message = "emagement fait"
                            self.erreur = false
                        }else {
                            self.message = "erreur tu n'es pas à l'heure ou aucun emargement prevu"
                            self.erreur = true
                        }
                    }else{
                        print("not ok")
                    }
                }
            }
        }
    }
}
