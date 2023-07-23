//
//  SliderView.swift
//  RGBLightUI
//
//  Created by Serj on 23.07.2023.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var text = ""
    
    let color: Color
    
    var body: some View {
        HStack {
            TextView(value: value)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = "\(lround(newValue))"
                }
            
            TextFieldView(text: $text, value: $value)
        }
        .onAppear {
            text = "\(lround(value))"
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorSliderView(value: .constant(123), color: .red)
        }
    }
}



