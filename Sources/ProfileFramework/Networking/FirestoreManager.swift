//
//  File.swift
//  
//
//  Created by Matthew Garlington on 6/4/22.
//

import SwiftUI
import Firebase


public class FirestoreManager: ObservableObject {
    @Published var post: String = ""
    
    public init() {
        fetchAllPostForUser()
    }
    
    public func fetchSinglePostForUser() {
        let dataBase = Firestore.firestore()
        
        let documentReference = dataBase.collection("Post").document("Matthew Garlington")
        
        documentReference.getDocument { document, error in
            guard error == nil else {
                print("Error getting single post for user: \(error!.localizedDescription)")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("Data: \(data)")
                    self.post = data["post"] as? String ?? ""
                }
            }
        }
        
    }
    
    public func fetchAllPostForUser() {
        let dataBase = Firestore.firestore()
        
        dataBase.collection("Post").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting all posts: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID): \(document.data())")
                }
            }
        }
    }
}
