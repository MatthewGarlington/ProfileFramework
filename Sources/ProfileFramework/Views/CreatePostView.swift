//
//  SwiftUIView.swift
//  
//
//  Created by Matthew Garlington on 6/4/22.
//

import SwiftUI
import ComposableArchitecture

public struct CreatePostView: View {
    public let store: Store<ProfileState, ProfileAction>
    
    public init(store: Store<ProfileState, ProfileAction>) {
        self.store = store
        UITextView.appearance().backgroundColor = .clear
    }
    
    @Environment(\.presentationMode) var presentationMode
    public var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStore<ProfileState, ProfileAction>) in
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Material.ultraThin)
                    .cornerRadius(8.0)
                    .shadow(color: .secondary.opacity(0.2), radius: 7, x: 7, y: 7)
                VStack(spacing: 15) {
                    Text("Create Post")
                        .font(.system(size: 17.0, weight: .semibold, design: .default))
                        TextEditor(text: viewStore.binding(get: { $0.postText }, send: ProfileAction.postTextChanged))
                            .background(Material.ultraThinMaterial)
                            .font(.system(size: 11.0, weight: .regular, design: .default))
                            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                            .frame(height: 125)
                    
                    Spacer()
                    
                    HStack {
                        
                        Button {
                            viewStore.send(ProfileAction.cancelPressed)
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .fill(Color.blue)
                                    .shadow(color: .blue.opacity(0.3), radius: 7, x: 7, y: 7)
                                
                                Text("Cancel")
                                    .font(.system(size: 13.0, weight: .regular, design: .default))
                                    .foregroundColor(.black)
                            }
                        }
                        .padding([.horizontal], 10)
                        
                        Spacer()
                           
                        Button {
                            viewStore.send(ProfileAction.confirmedPressed)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0, style: .continuous)
                                    .fill(Color.blue)
                                    .shadow(color: .blue.opacity(0.2), radius: 5, x: 5, y: 5)
                                
                                Text("Confirm")
                                    .font(.system(size: 13.0, weight: .semibold, design: .default))
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding([.horizontal], 10)
                    }
                    .frame(height: 33)
                }
                .padding()
            }
            
            .frame(width: 300, height: 225)
        }
    }
}

public struct CreatePostView_Previews: PreviewProvider {
    public static var mockStore = Store(
        initialState: ProfileState(),
        reducer: profileReducer,
        environment: .cancelRequest
    )
    public static var previews: some View {
        CreatePostView(store: mockStore)
    }
}
