//
//  Scanning.swift
//  Etna_Logger
//
//  Created by Aymeric Girault on 09/03/2022.
//

import SwiftUI
import CodeScanner
import SimpleToast

struct Scanning: View {
    @State var isShowingScanner = false
    @State var isShowingToast = false
    @State var scannedCode: String = "Scan a QR code"
    @StateObject private var ScannerModel:ScannerModelView = ScannerModelView()
    
    private let toastOptions = SimpleToastOptions(
        alignment: .center,
        hideAfter: 2.5,
        backdrop: Color.black.opacity(0.2),
        animation: .default,
        modifierType: .slide
    )
    
    var scannerSheet : some View {
        CodeScannerView(
        codeTypes: [.qr],
        completion: {result in
            if case let .success(code) = result {
                self.scannedCode = code.string
                ScannerModel.QrCodeResult = code.string
                ScannerModel.checkIn()
                isShowingScanner.toggle()
                isShowingToast.toggle()
            }
        }
        )
    }
    
    
    var body: some View {
        
        VStack(spacing: 10) {
            Text(scannedCode)
            
            Button {
                self.isShowingScanner = true
            } label: {
                Text("Scanner")
            }
            .sheet(isPresented: $isShowingScanner) {
                self.scannerSheet
            }
        }
        .simpleToast(isPresented: $isShowingToast, options: toastOptions, onDismiss: {
            isShowingScanner.toggle()
        }) {
            HStack {
                Image(systemName: "qrcode")
                Text(ScannerModel.message).font(.system(size: 17, weight: .black))
            }
            .padding(20)
            .background(ScannerModel.erreur ? Color.red : Color.green)
            .foregroundColor(.white)
            .cornerRadius(14)
        }
        }
    }



struct Scanning_Previews: PreviewProvider {
    static var previews: some View {
        Scanning().previewLayout(.sizeThatFits)
    }
}
