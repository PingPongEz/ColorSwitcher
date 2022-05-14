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
                
                RoundedRectangleForView(
                    colorRed: $sliderRedValue,
                    colorGreen: $sliderGreenValue,
                    colorBlue: $slidetBlueValue
                )
                
                SwiftUIView(sliderValue: $sliderRedValue, color: .red)
                    .focused($focusedField, equals: .red)
                    .onTapGesture {
                    buttonColor = .red
                }
                SwiftUIView(sliderValue: $sliderGreenValue, color: .green)
                    .focused($focusedField, equals: .green)
                    .onTapGesture {
                    buttonColor = .green
                }
                SwiftUIView(sliderValue: $slidetBlueValue, color: .blue)
                    .focused($focusedField, equals: .blue)
                    .onTapGesture {
                    buttonColor = .blue
                }
            }
        }
        .focused($tfFocused)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button {
                    tfFocused = false
                } label: {
                    Text("Done").bold()
                }
                .foregroundColor(buttonColor)
            }
        }
        .onTapGesture {
            tfFocused = false
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
