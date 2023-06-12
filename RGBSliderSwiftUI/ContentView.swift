//
//  ContentView.swift
//  RGBSliderSwiftUI
//
//  Created by Александр Полочанин on 12.06.23.
//

import SwiftUI

struct ContentView: View {
    
    @State var redSliderValue = Double.random(in: 0...255)
    @State var greenSliderValue = Double.random(in: 0...255)
    @State var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        
        ZStack {
            Color(red: 12 / 255, green: 89 / 255, blue: 255 / 255)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                MainView(
                    redValue: $redSliderValue,
                    greenValue: $greenSliderValue,
                    blueValue: $blueSliderValue
                )
            
                ColorSliderView(value: $redSliderValue, tintColor: .red)
                ColorSliderView(value: $greenSliderValue, tintColor: .green)
                ColorSliderView(value: $blueSliderValue, tintColor: .blue)
                
                Spacer()
    
            }
            .padding(EdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorSliderView: View {
    
    @Binding var value: Double
    let tintColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.white)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(tintColor)
            Text("255").foregroundColor(.white)
            TextField("Red", value: $value, formatter: NumberFormatter())
                .frame(width: 55.0,height: 30)
                .multilineTextAlignment(.center)
                .background(Color.white)
                .cornerRadius(4)
                .keyboardType(.numberPad)
        }
        .keyboardType(.numberPad)
       
    }
    
    
}

struct MainView: View {
    
    @Binding var redValue: Double
    @Binding var greenValue: Double
    @Binding var blueValue: Double
    
    var body: some View {
        Color(red: redValue / 255, green: greenValue / 255, blue: blueValue / 255)
            .cornerRadius(15)
            .frame(height: 150)
            .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white, lineWidth: 4))
    }
}
