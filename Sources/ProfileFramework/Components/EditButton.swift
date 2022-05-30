//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI

struct EditButton: View {
    @State private var isPressed = false
    var body: some View {
        ZStack {
            Button("Edit") { }
            .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: Color.white.opacity(0.3)))
        }
    }
}


struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton()
    }
}
