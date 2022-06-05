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
    public var isLikesPressedAnimation: Bool
    public var isPostsPressedAnimation: Bool
    public var postText: String
    public var cancelPressed: Bool
    public var confirmedPressed: Bool
    public var isValidated: Bool {
        return !postText.isEmpty
    }
    
    public init(
        show: Bool = false,
        longPress: Bool = false,
        name: String = "Matthew Garlington",
        description: String = "This is a Post to the app echo written once in TCA so that all future posts can be easy to integerate!",
        showComment: Bool = false,
        activate: Bool = false,
        showPostEdit: Bool = false,
        isLikesPressedAnimation: Bool = false,
        isPostsPressedAnimation: Bool = false,
        postText: String = "",
        cancelPressed: Bool = false,
        confirmedPressed: Bool = false
    ) {
        self.show = show
        self.longPress = longPress
        self.name = name
        self.description = description
        self.showComment = showComment
        self.activate = activate
        self.showPostEdit = showPostEdit
        self.isLikesPressedAnimation = isLikesPressedAnimation
        self.isPostsPressedAnimation = isPostsPressedAnimation
        self.postText = postText
        self.cancelPressed = cancelPressed
        self.confirmedPressed = confirmedPressed
    }
}

public enum ProfileAction: Equatable {
    case didShow
    case longPress
    case deactivate
    case hidePostEdit
    case likeIsPressed
    case postIsPressed
    case postTextChanged(String)
    case cancelPressed
    case confirmedPressed
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
    case .likeIsPressed:
        state.isLikesPressedAnimation.toggle()
        return .none
    case .postIsPressed:
        state.isPostsPressedAnimation.toggle()
        return .none
    case let .postTextChanged(postText):
        state.postText = postText
        return .none
    case .cancelPressed:
        state.cancelPressed = true 
        return .none
    case .confirmedPressed:
        state.confirmedPressed = true
        return .none
    }
}
