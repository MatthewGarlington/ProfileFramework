//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI

struct ProfileInfoButtonLabel: View {
    var title: String
    var body: some View {
        Text(title)
            .bold()
    }
}


struct ProfileInfoButtonLabel_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoButtonLabel(title: "Likes")
    }
}
