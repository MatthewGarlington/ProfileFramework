//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//


import SwiftUI

struct ProfileNameBoard: View {
    var body: some View {
        VStack {
            Text("Matthew Garlington")
                .font(.title3)
                .fontWeight(.bold)
            Text("xdce2g2d...g8dg")
                .foregroundColor(.secondary)
        }
    }
}

struct ProfileNameBoard_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNameBoard()
    }
}

