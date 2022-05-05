//
//  HideNavSpace.swift
//  Etna_Logger
//
//  Created by Irene Kaewklin  on 10/03/2565 BE.
//

import Foundation
import SwiftUI

struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}
