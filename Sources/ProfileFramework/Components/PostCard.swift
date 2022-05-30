//
//  File.swift
//  
//
//  Created by Matthew Garlington on 5/29/22.
//

import SwiftUI
import ComposableArchitecture

struct PostCard: View {
    public let store: Store<ProfileState, ProfileAction>

    public init(store: Store<ProfileState, ProfileAction>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStore<ProfileState, ProfileAction>) in
        ZStack(alignment: .bottomTrailing) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                    .fill(Material.ultraThinMaterial)
                    .frame(height: 350)
                // .shadow(color: .red.opacity(0.2), radius: 15, x: 5, y: 5)
                    .padding()
                RoundedRectangle(cornerRadius: 16.0, style: .continuous)
                    .stroke(Color.green.opacity(0.4), lineWidth: 3)
                    .frame(height: 350)
                    .padding()
                VStack {
                    HStack {
                        ProfilePic(circleSize: 65, imageSize: 100)
                            .onLongPressGesture(minimumDuration: 0.5, maximumDistance: 2.0, perform: {
                                withAnimation(.spring()) {
                                    viewStore.send(.didShow)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        withAnimation(.spring()) {
                                            viewStore.send(.longPress)
                                        }
                                    }
                                }
                            })
                        Text(viewStore.state.name)
                    }
                    .padding()
                    
                    Text(viewStore.state.description)
                        .padding()
                    if viewStore.state.showComment {
                    HStack {
                        Spacer()
                        Button {
                            //
                        } label: {
                            PostCardButton(image: "hand.thumbsup")
                        }
                        
                        Spacer()
                        Button {
                            //
                        } label: {
                            PostCardButton(image: "hand.thumbsdown")
                        }
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            PostCardButton(image: "rectangle.3.group.bubble.left")
                        }
                        Spacer()
                        
                        Button {
                            //
                        } label: {
                            EchoBadge()
                        }
                        Spacer()
                        
                    }
                    .offset(y: 5)
                    
                    .padding()
                    }
            
                }
                .padding()
            }
        }
        }
    }
}

struct PostCard_Previews: PreviewProvider {
    static let mockStore = Store(
        initialState: ProfileState(),
        reducer:  profileReducer,
        environment: .cancelRequest
    )
    static var previews: some View {
        PostCard(store: mockStore)
    }
}

struct PostCardButton: View {
    var image: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Material.ultraThinMaterial)
                .frame(width: 45, height: 45)
                .shadow(color: .black.opacity(0.4), radius: 10, x: 5, y: 5)
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: 45, height: 45)
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.black)
        }
    }
}

