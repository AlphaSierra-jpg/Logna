//
//  GetScreenSize.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 08/03/2022.
//

import Foundation
import SwiftUI

extension View {
    func getScreenSize()->CGRect {
        
        return UIScreen.main.bounds
    }
}
