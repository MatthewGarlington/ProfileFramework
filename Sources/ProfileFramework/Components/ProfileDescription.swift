//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI

struct ProfileDescription: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .fill(.ultraThinMaterial)
                .frame(height: 100)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)
            RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                .stroke(Material.ultraThinMaterial, lineWidth: 2)
            
            Text("iOS Developer at RoofSnap, tech fan, SwiftUI Junkie, and a pretty decent acquaintance")
                .font(.system(size: 18, weight: .light))
                .padding()
        }
        .padding()
    }
}

struct ProfileDescription_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDescription()
    }
}
