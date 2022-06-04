//
//  Sunshine.swift
//  animation and drawing
//
//  Created by Георгий Кузнецов on 03.06.2022.
//

import SwiftUI

struct Sunshine: View {
    @Binding var dark: Bool
    @Binding var colors: [Color]
    @Binding var startRadius: CGFloat
    @Binding var endRadius: CGFloat
    var opacity: Double
    var body: some View {
        ZStack {
        Rectangle()
                .fill(RadialGradient(gradient: Gradient(colors: colors),
                                     center: UnitPoint(x: 0.5, y: 1),
                                     startRadius: startRadius,
                                     endRadius: endRadius)
            )
            .opacity(opacity)
            .animation(.easeOut(duration: 3) )
        }
    }
    }
