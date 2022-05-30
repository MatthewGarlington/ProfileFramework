//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import Combine
import ComposableArchitecture
import Foundation

/**
 This template client is responsible for all the class related to estimate templates.
 */
public struct ProfileClient<Model, Failure: Error>: SettableAccessToken {
    public var setAccessToken: (_ accessToken: String) -> Effect<Never, Never>

    public init(
        setAccessToken: @escaping (_ accessToken: String) -> Effect<Never, Never>
    ) {
        self.setAccessToken = setAccessToken
    }
}

public extension ProfileClient
    where Failure == NetworkError
{
    
}
