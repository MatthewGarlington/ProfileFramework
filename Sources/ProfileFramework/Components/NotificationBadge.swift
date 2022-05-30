//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI

struct NotificationBadge: View {
    var number: Int
    @Binding var isPressed: Bool
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.red.opacity(0.4))
                Circle()
                    .stroke(Color.red, lineWidth: 1)
                Text("\(number)")
                    .bold()
                    .font(.system(size: 12))
            }
            .frame(width: 25, height: 25)
        }
        .offset(x: 25, y: -20)
        .scaleEffect(isPressed ? 0.7 : 1.0)
        .animation(.spring(), value: isPressed)
    }
}

struct NotificationBadge_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBadge(number: 12, isPressed: .constant(false))
    }
}
