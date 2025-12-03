//
//  QRCodeViewModel.swift
//  Generate_Menu_Image
//
//  Created by Carki on 12/2/25.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

import Factory

final class QRCodeViewModel: ObservableObject {
    @Injected(\.appContext) var appContext
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)

        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
