//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI
import ComposableArchitecture

public struct ProfileState: Equatable {
    public var show: Bool
    public var longPress: Bool
    public var name: String
    public var description: String
    public var showComment: Bool
    public var activate: Bool
    public var showPostEdit: Bool
    
    public init(
        show: Bool = false,
        longPress: Bool = false,
        name: String = "Matthew Garlington",
        description: String = "This is a Post to the app echo written once in TCA so that all future posts can be easy to integerate!",
        showComment: Bool = false,
        activate: Bool = false,
        showPostEdit: Bool = false
    ) {
        self.show = show
        self.longPress = longPress
        self.name = name
        self.description = description
        self.showComment = showComment
        self.activate = activate
        self.showPostEdit = showPostEdit
    }
}

public enum ProfileAction: Equatable {
    case didShow
    case longPress
    case deactivate
    case hidePostEdit
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
    case .deactivate:
        state.activate = false 
        return .none
    case .hidePostEdit:
        state.showPostEdit = false 
        return .none
    }
}
