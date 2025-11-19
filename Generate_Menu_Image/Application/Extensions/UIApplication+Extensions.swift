//
//  UIApplication+Extensions.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/20/25.
//

import SwiftUI

extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
