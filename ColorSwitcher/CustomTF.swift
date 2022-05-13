//
//  CustomTF.swift
//  ColorSwitcher
//
//  Created by Сергей Веретенников on 12/05/2022.
//

//import Foundation
//import SwiftUI
//
//struct CustomTF: UIViewRepresentable {
//    
//    @Binding var text: String
//    var placeholder = "255"
//    
//    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<CustomTF>) {
//        uiView.text = text
//        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        
//    }
//    
//    func makeUIView(context: UIViewRepresentableContext<CustomTF>) -> some UITextField {
//        let textField = UITextField(frame: .zero)
//        textField.delegate = context.coordinator
//        textField.placeholder = placeholder
//        return textField
//    }
//}
