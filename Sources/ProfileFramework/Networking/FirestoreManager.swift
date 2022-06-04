//
//  File.swift
//  
//
//  Created by Matthew Garlington on 6/4/22.
//

import SwiftUI
import Firebase
 

class FirestoreManager: ObservableObject {
    @Published var post: String = ""
    
    init() {
        fetchPost()
    }
    
    func fetchPost() {
        let dataBase = Firestore.firestore()
        
        let documentReference = dataBase.collection("Post").document("Matthew Garlington")
        
        documentReference.getDocument { document, error in
            guard error == nil else {
                print("\(error!.localizedDescription)")
                return
            }
            
            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("Data: \(data)")
                    self.post = data["name"] as? String ?? ""
                }
            }
        }
        
    }
}
