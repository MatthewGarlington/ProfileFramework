//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import Foundation
import ComposableArchitecture

public struct ProfileState: Equatable {
    public var show: Bool
    public var longPress: Bool
    public var name: String
    public var description: String
    public var showComment: Bool
    
    public init(
        show: Bool = false,
        longPress: Bool = false,
        name: String = "",
        description: String = "",
        showComment: Bool = false
    ) {
        self.show = show
        self.longPress = longPress
        self.name = name
        self.description = description
        self.showComment = showComment 
    }
}

public enum ProfileAction: Equatable {
    case didShow
    case longPress
}

public typealias ProfileEnviroment = NetworkRequestAction<Nothing, NetworkError>



public let profileReducer = Reducer<ProfileState, ProfileAction, ProfileEnviroment> { state, action, env in
    
    switch action {
    case .didShow:
        state.show.toggle()
        state.longPress.toggle()
        return .none
    case .longPress:
        state.longPress.toggle()
        return .none
    }
}
