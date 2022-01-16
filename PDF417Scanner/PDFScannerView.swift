//
//  PDFScannerView.swift
//  PDF417Scanner
//
//  Created by robevans on 1/15/22.
//

import SwiftUI
import CodeScanner

struct PDFScannerView: View {
    @State var isPresentingScanner = false
    @StateObject var qrScannerManager = QRScannerManager()

    var body: some View {
        VStack {
            ForEach(qrScannerManager.scanDetails, id: \.self) { details in
                Text(details)
            }
            Button(action: {
                qrScannerManager.isPresentingScanner = true
            }) {
                Text("Scan")
                    .font(.largeTitle)
                    .bold()
                Image(systemName: "qrcode")
            }
            .sheet(isPresented: $qrScannerManager.isPresentingScanner) {
                CodeScannerView(codeTypes: [.pdf417, .qr, .code39], completion: qrScannerManager.handleScan)
            }

        }
    }


//    func handleScan(result: Result<ScanResult, ScanError>) {
//        isPresentingScanner = false
//        switch result {
//        case .success(let result):
//            let details = result.string.components(separatedBy: "\n")
//            print("details: \(details)")
//
//        case .failure(_):
//            print("error")
//        }
//    }
}

struct PDFScannerView_Previews: PreviewProvider {
    static var previews: some View {
        PDFScannerView()
    }
}
