//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI


struct FollowersHeader: View {
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Text("100")
                    .bold()
                Text("Friends")
            }
            Spacer()
            HStack {
                Text("150")
                    .bold()
                Text("Following")
            }
            Spacer()
            HStack {
                Text("20.1K")
                    .bold()
                Text("Followers")
            }
            Spacer()
        }
    }
}

struct FollowersHeader_Previews: PreviewProvider {
    static var previews: some View {
        FollowersHeader()
    }
}

