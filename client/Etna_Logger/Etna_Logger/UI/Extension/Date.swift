//
//  Date.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 09/03/2565 BE.
//

import SwiftUI
import Foundation

//function : display current time with dateFormatter

func getFormattedDate(date: Date, format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: date)
}

