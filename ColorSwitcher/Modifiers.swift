//
//  Modifiers.swift
//  ColorSwitcher
//
//  Created by Сергей Веретенников on 12/05/2022.
//

import Foundation
import SwiftUI

struct SizeFromCG: ViewModifier {
    let size: CGSize
    func body(content: Content) -> some View {
        content
            .frame(width: size.width, height: size.height)
    }
}

extension View {
    func frame(size: CGSize) -> some View {
        modifier(SizeFromCG(size: size))
    }
}
