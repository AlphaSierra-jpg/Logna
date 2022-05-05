//
//  UserModel.swift
//  Etna_Logger
//
//  Created by Charles Coste on 14/03/2022.
//
import Foundation
import SwiftUI

struct UserResStruct: Identifiable,Codable,Hashable {
    let id: UUID = UUID()
    let login: String
    let firstname: String
    let lastname: String
    let date: String
    let morningSignature: String
    let afternoonSignature: String
    let promotion: String
    let promotion_id: Int
}
