//
//  Collection+Extensions.swift
//  Generate_Menu_Image
//
//  Created by Carki on 11/28/25.
//

import Foundation

extension Collection {
    var indexedArray: [(offset: Int, element: Element)] {
        Array(self.enumerated())
    }
}
