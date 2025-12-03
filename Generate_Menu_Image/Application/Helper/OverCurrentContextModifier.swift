//
//  OverCurrentContextModifier.swift
//  Generate_Menu_Image
//
//  Created by Carki on 12/2/25.
//

import SwiftUI

struct OverCurrentContextModifier: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        controller.modalPresentationStyle = .overCurrentContext
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}
