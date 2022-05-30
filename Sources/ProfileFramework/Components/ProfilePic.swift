//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI

struct ProfilePic: View {
    var circleSize: CGFloat
    var imageSize: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .fill(.ultraThinMaterial)
                .frame(width: circleSize + 5, height: circleSize + 20)
              //  .shadow(color: .white.opacity(0.2), radius: 5, x: 5, y: 5)
            Circle()
                .stroke(Material.ultraThinMaterial, lineWidth: 3)
                .frame(width: circleSize + 5, height: circleSize - 10)
            
            Image("profilePic", bundle: .module)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: imageSize, height: imageSize)
        }
    }
}

struct ProfilePic_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePic(circleSize: 90, imageSize: 140)
    }
}

