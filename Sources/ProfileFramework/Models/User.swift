//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import Foundation

struct Post: Identifiable {
    var id = UUID().uuidString
    var name: String
    var post: String
    var profilePic: String
}
