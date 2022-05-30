//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI

struct EchoBadge: View {
    @State private var echo = false
    @State private var bounce = false
    @State private var fade = false
    @State private var outer = false
    let buttonSize: CGFloat = 50
    let color: Color = .black
    var body: some View {
        Button {
            withAnimation(.easeInOut) {
               // echo.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.03) {
                    withAnimation {
                        echo = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        bounce = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        fade = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        bounce = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        outer = true
                    }
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        echo = false
                        outer = false
                        bounce = false
                        fade = false
                        outer = false
                    }
                }
        }
    } label: {
        ZStack {
            Circle()
                .fill(color.opacity(0.3))
                .frame(width: buttonSize, height: buttonSize)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 5, y: 5)
            
            EchoRing(echo: $echo, shrinkSize: 45, buttonSize: buttonSize, color: color)
            
            EchoRing(echo: $echo, shrinkSize: 35, buttonSize: buttonSize, color: color)
            
            EchoRing(echo: $echo, shrinkSize: 45, buttonSize: buttonSize, color: color)
            
            BounceRing(bounce: $bounce, expandedSize: 95, buttonSize: buttonSize, color: color)
            
            BounceRing(bounce: $bounce, expandedSize: 90, buttonSize: buttonSize, color: color)
           
            FadeRing(fade: $fade, exapndedSize: 80, buttonSize: buttonSize, color: color)
            
            FadeRing(fade: $fade, exapndedSize: 100, buttonSize: buttonSize, color: color)
            
            OuterRing(outer: $outer, exapndedSize: 100, buttonSize: buttonSize, color: color)
            
            
            Image(systemName: "dot.radiowaves.left.and.right")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .frame(width: buttonSize - 20, height: buttonSize - 29)
        }
        .frame(width: 20, height: 20)
    }
    
}
}

struct EchoBadge_Previews: PreviewProvider {
    static var previews: some View {
        EchoBadge()
    }
}

struct FadeRing: View {
    @Binding var fade: Bool
    var exapndedSize: CGFloat
    var buttonSize: CGFloat
    var color: Color
    var body: some View {
        Circle()
            .stroke(color, lineWidth: 3)
            .frame(width: fade ? exapndedSize : buttonSize, height: fade ? exapndedSize : buttonSize)
            .opacity(fade ? 0 : 1)
    }
}

struct BounceRing: View {
    @Binding var bounce: Bool
    var expandedSize: CGFloat
    var buttonSize: CGFloat
    var color: Color
    var body: some View {
        Circle()
            .stroke(color, lineWidth: 2)
            .frame(width: bounce ? expandedSize : buttonSize, height: bounce ? expandedSize : buttonSize)
            .opacity(bounce ? 0 : 1)
    }
}

struct EchoRing: View {
    @Binding var echo: Bool
    var shrinkSize: CGFloat
    var buttonSize: CGFloat
    var color: Color
    var body: some View {
        Circle()
            .stroke(color, lineWidth: 2)
            .frame(width: echo ? shrinkSize : buttonSize, height: echo ? shrinkSize : buttonSize)
    }
}

struct OuterRing: View {
    @Binding var outer: Bool
    var exapndedSize: CGFloat
    var buttonSize: CGFloat
    var color: Color
    var body: some View {
        Circle()
            .stroke(color, lineWidth: 2)
            .frame(width: outer ? exapndedSize : buttonSize, height: outer ? exapndedSize : buttonSize)
            .opacity(outer ? 0 : 1)
    }
}


