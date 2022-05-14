//
//  RoundedRectangle.swift
//  ColorSwitcher
//
//  Created by Сергей Веретенников on 14/05/2022.
//

import SwiftUI

struct RoundedRectangleForView: View {
    
    let sizeOfRectangle = CGSize(width: 250, height: 160)
    @Binding var colorRed: Double
    @Binding var colorGreen: Double
    @Binding var colorBlue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 14)
            .foregroundColor(
                Color(.sRGB, red: colorRed / 255, green: colorGreen / 255, blue: colorBlue / 255, opacity: 1.0)
            )
        
            .frame(size: sizeOfRectangle)
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white, lineWidth: 3))
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 56, trailing: 16))
    }
}

struct Random: View {
    
    @State private var random = Double.random(in: 0...255)
    
    var body: some View {
        RoundedRectangleForView(colorRed: $random, colorGreen: $random, colorBlue: $random)
    }
}

struct RoundedRectangle_Previews: PreviewProvider {
    static var previews: some View {
        Random()
    }
}
