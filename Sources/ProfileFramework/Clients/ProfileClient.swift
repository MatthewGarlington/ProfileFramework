//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import Combine
import ComposableArchitecture
import Foundation



public struct ProfileClient<Model, Failure: Error>: SettableAccessToken {
    public var setAccessToken: (_ accessToken: String) -> Effect<Never, Never>
    public var getUserPosts: (_ userId: UUID) -> Effect<Model, Failure>
    
    public init(
        setAccessToken: @escaping (_ accessToken: String) -> Effect<Never, Never>,
        getUserPosts: @escaping (_ userId: UUID) -> Effect<Model, Failure>
    ) {
        self.setAccessToken = setAccessToken
        self.getUserPosts = getUserPosts
    }
}

public extension ProfileClient
    where Model == Post, Failure == NetworkError
{
    
   // static func
    
}
