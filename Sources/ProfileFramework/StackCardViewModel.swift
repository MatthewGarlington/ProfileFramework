//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import Foundation



class StackCardViewModel: ObservableObject {
    
    // Store All the fetched Users here...
    // Since we're building UI so using sample Users here....
    @Published var fetched_posts: [Post] = []
    
    @Published var displaying_posts: [Post]?
    
    init(){
        
        // fetching users...
        fetched_posts = [
        
            Post(name: "Natalia", post: "Vadalia NYC", profilePic: "User1"),
            Post(name: "Elisa", post: "Central Park NYC", profilePic: "User2"),
            Post(name: "Jasmine", post: "Metropolitan Museum NYC", profilePic: "User3"),
            Post(name: "Zahra", post: "Liberty NYC", profilePic: "User4"),
            Post(name: "Angelina", post: "Empier State NYC", profilePic: "User5"),
            Post(name: "Brittany", post: "Time Square NYC", profilePic: "User6")
        ]
        
        // storing it in displaying users..
        // what is displaying users?
        // it will be updated/removed based on user interaction to reduce memory usage...
        // and the same time we need all the fetched users data....
        displaying_posts = fetched_posts
    }
    
    // retreiving index...
    func getIndex(post: Post)->Int{
        
        let index = displaying_posts?.firstIndex(where: { currentPost in
            return post.id == currentPost.id
        }) ?? 0
        
        return index
    }
}

