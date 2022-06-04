

import SwiftUI
import ComposableArchitecture

public struct ProfileInfoBar: View {
    public let store: Store<ProfileState, ProfileAction>
    
    public init(store: Store<ProfileState, ProfileAction>) {
        self.store = store
    }
    public var body: some View {
        WithViewStore(self.store) { (viewStore: ViewStore<ProfileState, ProfileAction>) in
            HStack {
                HStack {
                    Spacer()
                    ZStack {
                        Button {
                            withAnimation {
                                viewStore.send(.likeIsPressed)
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    viewStore.send(.likeIsPressed)
                                }
                            }
                        } label: {
                            ProfileInfoButtonLabel(title: "Likes")
                        }
                        NotificationBadge(number: 12, isPressed: viewStore.binding(get: { $0.isLikesPressedAnimation }, send: ProfileAction.likeIsPressed))
                    }
                    .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: .red.opacity(0.4)))
                    Spacer()
                    HStack {
                        ZStack {
                            Button {
                                withAnimation {
                                    viewStore.send(.postIsPressed)
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                        viewStore.send(.postIsPressed)
                                    }
                                }
                            } label: {
                                ProfileInfoButtonLabel(title: "Posts")
                            }
                            Spacer()
                            NotificationBadge(number: 120, isPressed: viewStore.binding(get: { $0.isPostsPressedAnimation } , send: ProfileAction.postIsPressed))
                        }
                    }
                    .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: .red.opacity(0.4)))
                    Spacer()
                    Button {
                        //
                    } label: {
                        ProfileInfoButtonLabel(title: "Comments")
                    }
                    .buttonStyle(LongPrimitiveButtonStyle(minDuration: 0.2, pressedColor: .red.opacity(0.4)))
                    Spacer()
                    
                    EditButton()
                    Spacer()
                }
            }
        }
    }
}

public struct ProfileInfoBar_Previews: PreviewProvider {
    static var mockStore = Store(
        initialState: ProfileState(),
        reducer: profileReducer,
        environment: .cancelRequest
    )
    public static var previews: some View {
        ProfileInfoBar(store: mockStore)
    }
}
