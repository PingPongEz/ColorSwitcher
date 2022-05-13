//
//  ContentView.swift
//  ColorSwitcher
//
//  Created by Сергей Веретенников on 12/05/2022.
//

import SwiftUI

enum Field {
    case red
    case green
    case blue
}

struct ContentView: View {
    
    let sizeOfRectangle = CGSize(width: 250, height: 160)
    @State private var sliderRedValue = Double.random(in: 1...255)
    @State private var sliderGreenValue = Double.random(in: 1...255)
    @State private var slidetBlueValue = Double.random(in: 1...255)
    @State private var buttonColor = Color(uiColor: .red)
    @FocusState private var focusedField: Field?
    @FocusState private var tfFocused: Bool
    
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(.gray)
            VStack {
                
                RoundedRectangle(cornerRadius: 14)
                    .foregroundColor(
                        Color(
                            CGColor(
                                red: sliderRedValue / 255,
                                green: sliderGreenValue / 255,
                                blue: slidetBlueValue / 255,
                                alpha: 1
                            )
                        )
                    )
                
                    .frame(size: sizeOfRectangle)
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(.white, lineWidth: 3))
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 56, trailing: 16))
                SwiftUIView(sliderValue: $sliderRedValue, color: .red)
                    .focused($focusedField, equals: .red)
                SwiftUIView(sliderValue: $sliderGreenValue, color: .green)
                    .focused($focusedField, equals: .green)
                SwiftUIView(sliderValue: $slidetBlueValue, color: .blue)
                    .focused($focusedField, equals: .blue)
            }
        }
        .focused($tfFocused)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    tfFocused = false
                }
                .foregroundColor(buttonColor)
            }
        }
        .onTapGesture {
            tfFocused = false
        }
    }
}

struct SwiftUIView: View {
    
    @Binding var sliderValue: Double
    @State private var text = ""
    @FocusState var tfFocused: Bool
    
    let color: Color
    
    
    var body: some View {
        HStack {
            Text("0").bold()
                .font(.system(size: 16))
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 4))
                .foregroundColor(.black)
            Slider(value: $sliderValue, in: 0...255, step: 1)
            
                .onAppear(perform: {
                    text = String(lround(sliderValue))
                })
                .onChange(of: sliderValue, perform: { _ in
                    text = String(lround(sliderValue))
                })
            
                .tint(color)
                .background(.white).cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 1))
                .shadow(color: .black, radius: 1, x: 1, y: 1)
            
            TextField("", text: $text) { _ in
                if var value = Double(text) {
                    if value < 0 {
                        value = 0
                    }
                    if value > 255 {
                        value = 255
                    }
                    sliderValue = value
                } else {
                    sliderValue = 0
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
    }
}

struct TapGestureView {
    @State var didTap = false
    
    var tap: some Gesture {
        TapGesture(count: 1)
            .onEnded { _ in
                self.didTap = !self.didTap
            }
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .previewInterfaceOrientation(.portrait)
//    }
//}
//
//struct ColorModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//
//    }
//}
