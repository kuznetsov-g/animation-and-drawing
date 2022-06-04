//
//  cityView.swift
//  animation and drawing
//
//  Created by Георгий Кузнецов on 04.06.2022.
//

import SwiftUI

struct CityView: View {
    @State var dark = false
    @State var cityColor: Color = .black
    @State var colors: [Color] = [ .orange, Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)) , Color(#colorLiteral(red: 0.0696423034, green: 0.1709778328, blue: 0.3408907861, alpha: 1)), .black]
    @State var startRadius: CGFloat = 0
    @State var endRadius: CGFloat = 0
    @State var backgroundOpacity: Double = 1
    @State var cityOpacity: Double = 1
    @State var mirrorCityOpacity: Double = 1
    @State var buttonTitle = "Add Sun"
    var body: some View {
        VStack {
        ZStack {
            Sunshine(dark: $dark,
                     colors: $colors,
                     startRadius: $startRadius,
                     endRadius: $endRadius,
                     opacity: 1)
            .frame(width: 415, height: 460)
            .offset(y: -230)
            NYcity(cityColor: $cityColor,
                   dark: dark,
                   x: 1,
                   y: 1,
                   opacity: cityOpacity)
                .offset(x: 10, y: 395)
            Sunshine(dark: $dark,
                     colors: $colors,
                     startRadius: $startRadius,
                     endRadius: $endRadius,
                     opacity: backgroundOpacity)
            .frame(width: 415, height: 460)
            .offset(y: -230)
            .rotationEffect(.degrees(180))
            NYcity(cityColor: $cityColor,
                   dark: dark,
                   x: 1,
                   y: -1,
                   opacity: mirrorCityOpacity )
                .offset(x: 10, y: 394)

        }
            HStack{
            Button(buttonTitle){
            colors = [ .orange, Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)) , Color(#colorLiteral(red: 0.0696423034, green: 0.1709778328, blue: 0.3408907861, alpha: 1)), .black]
                if dark {
                    buttonTitle = "Add Sun"
                    startRadius = 0
                    endRadius = 0
                    cityOpacity = 1
                    mirrorCityOpacity = 1
                    backgroundOpacity = 1
                    
                } else {
                    buttonTitle = "Turn off Sun"
                    startRadius = 50
                    endRadius = 400
                    cityOpacity = 1
                    mirrorCityOpacity = 0.8
                    backgroundOpacity = 0.8
                    cityColor = .black
                }
                dark.toggle()
            }.padding(.leading, 20)
            Spacer()
            Button("Black hole"){
                mirrorCityOpacity = 1
                cityOpacity = 1
                cityColor = .gray
                colors = [.black, Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)) , .black]
                startRadius = 150
                endRadius = 200
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)){
                    mirrorCityOpacity = 0
                    cityOpacity = 0
                }
                buttonTitle = "Get back NY"
            }.padding(.trailing, 20)
                    .disabled(dark)
            }
        }
    }
}
