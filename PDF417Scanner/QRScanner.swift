//
//  QRScanner.swift
//  PDF417Scanner
//
//  Created by robevans on 1/15/22.
//

import Foundation
import CodeScanner

class QRScannerManager: ObservableObject {

    @Published var scanDetails: [String] = []
    @Published var isPresentingScanner: Bool = false

    func handleScan(result: Result<ScanResult, ScanError>) {
        isPresentingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            scanDetails = details
            print("details: \(details)")

        case .failure(_):
            print("error")
        }
    }
}
