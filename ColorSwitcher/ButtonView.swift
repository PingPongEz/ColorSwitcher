//
//  ButtonView.swift
//  ColorSwitcher
//
//  Created by Сергей Веретенников on 14/05/2022.
//

import SwiftUI

struct SwiftUIView: View {
    
    @Binding var sliderValue: Double
    @State private var text = ""
    
    let color: Color
    
    
    var body: some View {
        HStack {
            Text("0").bold()
                .font(.system(size: 16))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 4))
                .foregroundColor(.black)
            Slider(value: $sliderValue, in: 0...255, step: 1)
            
                
                .onChange(of: sliderValue, perform: { _ in
                    text = String(lround(sliderValue))
                })
            
                .tint(color)
                .background(.white).cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 1))
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            
            TextField("", text: $text) { _ in
                if let value = Double(text) {
                    sliderValue = checkColorValue(with: value)
                }
            }
            .background()
            .cornerRadius(4)
            .frame(width: 40)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 0.5))
            .shadow(color: .black, radius: 0.5, x: 1, y: 1)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16))
            .keyboardType(.numberPad)
        }
        .onAppear { text = String(lround(sliderValue)) }
    }
    
    private func checkColorValue(with value: Double) -> Double {
        if value < 0 {
            return 0
        } else if value > 255 {
            return 255
        } else {
            return value
        }
    }
}

struct rendomDouble: View {
    @State private var random = Double.random(in: 1...255)
    
    var body: some View {
        SwiftUIView(sliderValue: $random, color: .red)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        rendomDouble()
    }
}
